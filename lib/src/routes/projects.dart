import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:modrinth_api/src/client.dart';
import 'package:path/path.dart';

import '../models/request_models.dart';
import '../models/response_models.dart';
import '../modrinth_api_base.dart';

class Projects {
  final ModrinthApiClient _client;
  Projects(this._client);

  Future<ModrinthProject?> get(String idOrSlug) => _client
      .get("project/$idOrSlug".uri)
      .expect(const {200, 404}).parseOrNull<JsonObject, ModrinthProject>(ModrinthProject.fromJson);

  Future<void> modify(String idOrSlug, ModifyProject request) =>
      _client.patchJson("project/$idOrSlug".uri, request.toJson()).errorsOn(const {401}).expect(const {204});

  Future<void> delete(String idOrSlug) =>
      _client.delete("project/$idOrSlug".uri).errorsOn(const {400, 401}).expect(const {204});

  Future<Iterable<ModrinthProject>> getMultiple(List<String> ids) => _client
      .get("projects?ids=[${ids.map((e) => "\"$e\"").join(", ")}]".uri)
      .expect(const {200}).parse<JsonArray, Iterable<ModrinthProject>>(
          (json) => json.cast<JsonObject>().map(ModrinthProject.fromJson));

  Future<void> editMultiple(List<String> ids, EditMultipleProjects request) => _client
      .patchJson("projects?ids=[${ids.map((e) => "\"$e\"").join(", ")}]".uri, request.toJson())
      .errorsOn(const {400, 401}).expect(const {204});

  Future<Iterable<ModrinthProject>> getRandom(int count) => _client
      .get("projects_random?count=$count".uri)
      .errorsOn(const {400}).expect(const {200}).parse<JsonArray, Iterable<ModrinthProject>>(
          (json) => json.cast<JsonObject>().map(ModrinthProject.fromJson));

  Future<void> create(CreateProject project, {({Uint8List data, String filename})? icon}) {
    final request = MultipartRequest("POST", _client.route("project".uri))
      ..fields["data"] = jsonEncode(project.toJson());
    if (icon != null) {
      request.files.add(MultipartFile.fromBytes(
        "icon",
        icon.data,
        filename: icon.filename,
        contentType: MediaType("image", extension(icon.filename).substring(1)),
      ));
    }

    return _client.sendUnstreamed(request).errorsOn(const {400, 401}).expect(const {200});
  }

  Future<void> updateIcon(String idOrSlug, Uint8List iconData, String iconFilename) {
    final imageType = extension(iconFilename).substring(1);
    return _client.patch(
      "project/$idOrSlug/icon?ext=$imageType".uri,
      encoding: utf8,
      body: iconData,
      headers: {HttpHeaders.contentTypeHeader: "image/$imageType"},
    ).errorsOn(const {400}).expect(const {204});
  }

  Future<void> deleteIcon(String idOrSlug) =>
      _client.delete("project/$idOrSlug/icon".uri).errorsOn(const {400, 401}).expect(const {204});

  Future<bool> checkIdOrSlug(String idOrSlug) => _client
      .get("project/$idOrSlug/check".uri)
      .expect(const {200, 404}).then((response) => response.statusCode == 200);

  Future<void> addGalleryImage(
    String idOrSlug,
    Uint8List imageData,
    String imageFilename,
    bool featured, {
    String? title,
    String? description,
    int? ordering,
  }) {
    final imageType = extension(imageFilename).substring(1);
    return _client.post(
      "project/$idOrSlug/gallery".uri.replace(queryParameters: {
        "ext": imageType,
        "featured": featured.toString(),
        if (title != null) "title": title,
        if (description != null) "description": description,
        if (ordering != null) "ordering": ordering.toString(),
      }),
      encoding: utf8,
      body: imageData,
      headers: {HttpHeaders.contentTypeHeader: "image/$imageType"},
    ).errorsOn(const {400, 401}).expect(const {204});
  }

  Future<void> modifyGalleryImage(
    String idOrSlug,
    String url, {
    bool? featured,
    String? title,
    String? description,
    int? ordering,
  }) {
    var reponse = _client.patch("project/$idOrSlug/icon".uri.replace(queryParameters: {
      "url": url,
      if (featured != null) "featured": featured.toString(),
      if (title != null) "title": title,
      if (description != null) "description": description,
      if (ordering != null) "ordering": ordering.toString(),
    }));

    return reponse.errorsOn(const {401}).expect(const {204});
  }

  Future<void> deleteGalleryImage(String idOrSlug, String url) => _client
      .delete("project/$idOrSlug/gallery".uri.replace(queryParameters: {"url": url}))
      .errorsOn(const {400, 401}).expect(const {204});

  Future<(Iterable<ModrinthProject>, Iterable<ModrinthVersion>)?> getAllDependencies(String idOrSlug) => _client
      .get("project/$idOrSlug/dependencies".uri)
      .expect(const {200, 404}).parseOrNull<JsonObject, (Iterable<ModrinthProject>, Iterable<ModrinthVersion>)>(
          (json) => (
                (json["projects"] as JsonArray).cast<JsonObject>().map(ModrinthProject.fromJson),
                (json["versions"] as JsonArray).cast<JsonObject>().map(ModrinthVersion.fromJson)
              ));

  Future<Iterable<ModrinthVersion>?> getVersions(
    String idOrSlug, {
    List<String>? loaders,
    List<String>? gameVersions,
    bool? onlyFeatured,
  }) {
    var reponse = _client.get("project/$idOrSlug/version".uri.replace(queryParameters: {
      if (loaders != null) "loaders": loaders.map((e) => "\"$e\"").toList().toString(),
      if (gameVersions != null) "game_versions": gameVersions.map((e) => "\"$e\"").toList().toString(),
      if (onlyFeatured != null) "featured": onlyFeatured.toString(),
    }));

    return reponse.expect(const {200, 404}).parseOrNull<JsonArray, Iterable<ModrinthVersion>>(
        (json) => json.cast<JsonObject>().map(ModrinthVersion.fromJson));
  }

  Future<void> follow(String idOrSlug) =>
      _client.post("project/$idOrSlug/follow".uri).errorsOn(const {400, 401}).expect(const {204});

  Future<void> unfollow(String idOrSlug) =>
      _client.delete("project/$idOrSlug/follow".uri).errorsOn(const {400, 401}).expect(const {204});

  Future<void> schedule(String idOrSlug, DateTime time, ModrinthProjectStatus requestedStatus) =>
      _client.postJson("project/$idOrSlug/schedule".uri, {
        "time": time.toIso8601String(),
        "requested_status": requestedStatus,
      }).errorsOn(const {400, 401}).expect(const {204});
}
