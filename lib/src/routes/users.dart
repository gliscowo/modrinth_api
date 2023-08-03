import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:modrinth_api/src/client.dart';
import 'package:path/path.dart';

import '../models/request_models.dart';
import '../models/response_models.dart';
import '../modrinth_api_base.dart';

class Users {
  final ModrinthApiClient _client;
  Users(this._client);

  Future<ModrinthUser?> get(String idOrUsername) => _client
      .get("user/$idOrUsername".uri)
      .expect(const {200, 404}).parseOrNull<JsonObject, ModrinthUser>(ModrinthUser.fromJson);

  Future<void> modify(String idOrUsername, ModifyUser request) =>
      _client.patchJson("user/$idOrUsername".uri, request.toJson()).errorsOn(const {401}).expect(const {204});

  Future<void> delete(String idOrUsername) =>
      _client.delete("user/$idOrUsername".uri).errorsOn(const {401}).expect(const {204});

  Future<ModrinthUser?> getAuthorizedUser() {
    return _client.get("user".uri).expect(const {200, 401}).then((response) {
      if (response.statusCode == 401) return null;
      return ModrinthUser.fromJson(jsonDecode(response.body));
    });
  }

  Future<Iterable<ModrinthUser>> getMultiple(List<String> ids) => _client
      .get("users?ids=[${ids.map((e) => "\"$e\"").join(", ")}]".uri)
      .expect(const {200}).parse<JsonArray, Iterable<ModrinthUser>>(
          (json) => json.cast<JsonObject>().map(ModrinthUser.fromJson));

  Future<void> updateAvatar(String idOrUsername, Uint8List avatarData, String iconFilename) {
    final imageType = extension(iconFilename).substring(1);
    return _client.patch(
      "user/$idOrUsername/icon?ext=$imageType".uri,
      encoding: utf8,
      body: avatarData,
      headers: {HttpHeaders.contentTypeHeader: "image/$imageType"},
    ).errorsOn(const {400}).expect(const {204});
  }

  Future<Iterable<ModrinthProject>> getProjects(String idOrUsername) =>
      _client.get("user/$idOrUsername/projects".uri).expect(const {200}).parse<JsonArray, Iterable<ModrinthProject>>(
          (json) => json.cast<JsonObject>().map(ModrinthProject.fromJson));

  Future<Iterable<ModrinthNotification>> getNotifications(String idOrUsername) => _client
      .get("user/$idOrUsername/notifications".uri)
      .errorsOn(const {401}).expect(const {200}).parse<JsonArray, Iterable<ModrinthNotification>>(
          (json) => json.cast<JsonObject>().map(ModrinthNotification.fromJson));

  Future<Iterable<ModrinthProject>> getFollowedProjects(String idOrUsername) => _client
      .get("user/$idOrUsername/follows".uri)
      .errorsOn(const {401}).expect(const {200}).parse<JsonArray, Iterable<ModrinthProject>>(
          (json) => json.cast<JsonObject>().map(ModrinthProject.fromJson));

  Future<ModrinthPayoutHistory> getPayoutHistory(String idOrUsername) =>
      _client.get("user/$idOrUsername/payouts".uri).errorsOn(const {401}).expect(
          const {200}).parse<JsonObject, ModrinthPayoutHistory>(ModrinthPayoutHistory.fromJson);
}
