import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:modrinth_api/src/client.dart';
import 'package:path/path.dart';

import '../models/request_models.dart';
import '../models/response_models.dart';
import '../modrinth_api_base.dart';

class Versions {
  final ModrinthApiClient _client;
  Versions(this._client);

  Future<ModrinthVersion?> get(String id) => _client
      .get("version/$id".uri)
      .expect(const {200, 404}).parseOrNull<JsonObject, ModrinthVersion>(ModrinthVersion.fromJson);

  Future<void> modify(String id, ModifyVersion request) =>
      _client.patchJson("version/$id".uri, request.toJson()).errorsOn(const {401}).expect(const {204});

  Future<void> delete(String id) => _client.delete("version/$id".uri).errorsOn(const {401}).expect(const {204});

  Future<ModrinthVersion> create(CreateVersion version, List<File> files) async {
    final request = MultipartRequest("POST", _client.route("version".uri))
      ..fields["data"] = jsonEncode(version.toJson());
    for (final (idx, file) in files.indexed) {
      var name = basename(file.path);
      var ext = extension(file.path);

      request.files.add(await MultipartFile.fromPath(
        name,
        file.path,
        filename: name,
        contentType: switch (ext) {
          ".zip" || ".litemod" || ".mrpack" => MediaType("application", "zip"),
          ".jar" => MediaType("application", "java-archive"),
          _ => throw ArgumentError("Unsupported file type '$ext'", "files[$idx]")
        },
      ));
    }

    return _client
        .sendUnstreamed(request)
        .errorsOn(const {400, 401}).expect(const {200}).parse<JsonObject, ModrinthVersion>(ModrinthVersion.fromJson);
  }

  Future<void> schedule(String id, DateTime time, ModrinthVersionStatus requestedStatus) =>
      _client.postJson("version/$id/schedule".uri, {
        "time": time.toUtc().toIso8601String(),
        "requested_status": requestedStatus.name,
      }).errorsOn(const {400, 401}).expect(const {204});

  Future<Iterable<ModrinthVersion>> getMultiple(List<String> ids) => _client
      .get("versions?ids=[${ids.map((e) => "\"$e\"").join(", ")}]".uri)
      .expect(const {200}).parse<JsonArray, Iterable<ModrinthVersion>>(
          (json) => json.cast<JsonObject>().map(ModrinthVersion.fromJson));

  Future<void> addFiles(String id, List<File> files) async {
    final request = MultipartRequest("POST", _client.route("version/$id/file".uri))..fields["data"] = "{}";
    for (final (idx, file) in files.indexed) {
      var name = basename(file.path);
      var ext = extension(file.path);

      request.files.add(await MultipartFile.fromPath(
        name,
        file.path,
        filename: name,
        contentType: switch (ext) {
          ".zip" || ".litemod" || ".mrpack" => MediaType("application", "zip"),
          ".jar" => MediaType("application", "java-archive"),
          _ => throw ArgumentError("Unsupported file type '$ext'", "files[$idx]")
        },
      ));
    }

    await _client.sendUnstreamed(request).errorsOn(const {401}).expect(const {204});
  }
}
