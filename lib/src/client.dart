import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:modrinth_api/src/errors.dart';

import 'modrinth_api_base.dart';

class ModrinthApiClient extends BaseClient {
  final Client _delegate = Client();
  final Uri _baseUri;
  final String _userAgent;
  final String? _token;

  final RatelimitHandling _ratelimitHandling;
  int _ratelimitRemaining = 300;
  int? _ratelimitReset;

  ModrinthApiClient(
    this._userAgent,
    String baseUrl,
    this._ratelimitHandling,
    this._token,
  ) : _baseUri = Uri.parse(baseUrl);

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) => super.head(route(url), headers: headers);
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) => super.get(route(url), headers: headers);
  @override
  Future<Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      super.post(route(url), headers: headers, body: body, encoding: encoding);
  @override
  Future<Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      super.put(route(url), headers: headers, body: body, encoding: encoding);
  @override
  Future<Response> patch(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      super.patch(route(url), headers: headers, body: body, encoding: encoding);
  @override
  Future<Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      super.delete(route(url), headers: headers, body: body, encoding: encoding);

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (_ratelimitRemaining <= 0) {
      switch (_ratelimitHandling) {
        case RatelimitHandling.ignore:
          {}
        case RatelimitHandling.error:
          throw RatelimitExceededException((_ratelimitReset ?? DateTime.now().millisecondsSinceEpoch ~/ 1000) * 1000);
        case RatelimitHandling.wait:
          await Future.delayed(Duration(seconds: _ratelimitReset ?? 0));
      }
    }

    request.headers.addAll(_headers);

    var response = await _delegate.send(request);
    _ratelimitRemaining = (int.tryParse(response.headers["x-ratelimit-remaining"] ?? "300") ?? 300);
    _ratelimitReset = DateTime.now().millisecondsSinceEpoch ~/ 1000 +
        (int.tryParse(response.headers["x-ratelimit-reset"] ?? "0") ?? 0);

    return response;
  }

  Future<Response> sendUnstreamed(BaseRequest request) => send(request).then(Response.fromStream);

  Future<Response> postJson(Uri path, JsonObject body) => post(
        route(path),
        body: jsonEncode(body),
        encoding: utf8,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );

  Future<Response> patchJson(Uri path, JsonObject body) => patch(
        route(path),
        body: jsonEncode(body),
        encoding: utf8,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );

  Uri route(Uri route) => _baseUri.resolveUri(route);

  Map<String, String> get _headers => {
        HttpHeaders.userAgentHeader: _userAgent,
        if (_token != null) HttpHeaders.authorizationHeader: _token!,
      };

  @override
  void close() => _delegate.close();
}

extension ToUri on String {
  Uri get uri => Uri.parse(this);
}
