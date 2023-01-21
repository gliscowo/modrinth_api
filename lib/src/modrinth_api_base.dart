import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart';

import 'query_schemas.dart';
import 'type_models.dart';

const baseUrl = "https://api.modrinth.com/v2";
const encoder = JsonEncoder.withIndent("    ");

typedef JsonObject = Map<String, dynamic>;
typedef JsonArray = List<dynamic>;

class ModrinthApi {
  final Client _client = Client();
  final String _userAgent;

  /// Create a new API client
  ///
  /// Modrinth requires that you specifiy a user agent
  /// that uniquely identifies your application as [_userAgent]
  ModrinthApi.createClient(this._userAgent);

  Future<ModrinthSearchQueryResponse> search(String searchTerm) {
    return _getObject(ModrinthSearchQueryResponse.fromJson, "search?query=$searchTerm");
  }

  Future<ModrinthProject?> getProject(String idOrSlug) {
    return _getObject(ModrinthProject.fromJson, "project/$idOrSlug").nullifyBadStatus();
  }

  Future<ModrinthVersion?> getVersion(String id) {
    return _getObject(ModrinthVersion.fromJson, "version/$id").nullifyBadStatus();
  }

  Future<ModrinthUser?> getUser(String idOrUsername) {
    return _getObject(ModrinthUser.fromJson, "user/$idOrUsername").nullifyBadStatus();
  }

  Future<ModrinthVersion?> latestFileWithLoaderAndGameVersion(File file, String loader, String gameVersion) {
    return file
        .readAsBytes()
        .then(sha512.convert)
        .then((digest) => _postAndGetObject(ModrinthVersion.fromJson, "version_file/$digest/update?algorithm=sha512", {
              "loaders": [loader],
              "game_versions": [gameVersion]
            }))
        .nullifyBadStatus();
  }

  Future<Map<File, ModrinthVersion>?> latestFilesWithLoaderAndGameVersion(
      List<File> files, String loader, String gameVersion) async {
    final hashes = {for (var file in files) sha512.convert(file.readAsBytesSync()).toString(): file};

    return _postAndGetObject(
      (response) => <File, ModrinthVersion>{
        for (var hash in response.keys) hashes[hash]!: ModrinthVersion.fromJson(response[hash])
      },
      "version_files/update",
      {
        "hashes": [for (var digest in hashes.keys) digest],
        "algorithm": "sha512",
        "loaders": [loader],
        "game_versions": [gameVersion]
      },
    ).nullifyBadStatus();
  }

  Future<List<ModrinthVersion>?> getProjectVersions(String idOrSlug) {
    return _get<JsonArray>("project/$idOrSlug/version")
        .then((array) => array.map((e) => ModrinthVersion.fromJson(e)).toList())
        .nullifyBadStatus();
  }

  Future<T> _getObject<T>(T Function(JsonObject) deserializer, String path) {
    return _get<JsonObject>(path).then(deserializer);
  }

  Future<T> _postAndGetObject<T>(T Function(JsonObject) deserializer, String path, JsonObject body) {
    return _post<JsonObject>(path, body).then(deserializer);
  }

  Future<T> _get<T>(String path) {
    return _client.get(route(path), headers: {HttpHeaders.userAgentHeader: _userAgent}).then((response) {
      if (response.statusCode >= 400) {
        throw BadStatusException(response.statusCode);
      }

      return jsonDecode(utf8.decode(response.bodyBytes));
    });
  }

  Future<T> _post<T>(String path, JsonObject body) {
    return _client.post(route(path),
        body: jsonEncode(body),
        encoding: utf8,
        headers: {"content-type": "application/json", HttpHeaders.userAgentHeader: _userAgent}).then((response) {
      if (response.statusCode >= 400) {
        throw BadStatusException(response.statusCode);
      }

      return jsonDecode(utf8.decode(response.bodyBytes));
    });
  }

  /// Closes the HTTP client associated with this API client.
  ///
  /// This **needs** to be called at the end of an application's lifecycle,
  /// otherwise the process will hang and not exit
  void dispose() {
    _client.close();
  }
}

Uri route(String route) => Uri.parse("$baseUrl/$route");

class BadStatusException implements Exception {
  final int code;
  BadStatusException(this.code);
}

extension Nullable<T> on Future<T> {
  Future<T?> nullifyBadStatus() {
    return nullifyOnError((error) => error is BadStatusException);
  }

  Future<T?> nullifyOnError([bool Function(dynamic)? filter]) {
    return then<T?>((value) => value).catchError((error) {
      if (filter != null && !filter(error)) throw error;
      return null;
    });
  }
}
