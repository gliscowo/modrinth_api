import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:modrinth_api/src/client.dart';

import '../models/response_models.dart';
import '../modrinth_api_base.dart';

class VersionFiles {
  final ModrinthApiClient _client;
  VersionFiles(this._client);

  Future<ModrinthVersion?> getVersionFromFile(File file) =>
      getVersionFromHash(Hash.sha512(sha512.convert(file.readAsBytesSync()).toString()));

  Future<ModrinthVersion?> getVersionFromHash(Hash hash) => _client
      .get("version_file/${hash.value}?algorithm=${hash.algorithm}".uri)
      .expect(const {200, 404}).parseOrNull<JsonObject, ModrinthVersion>(ModrinthVersion.fromJson);

  Future<void> deleteFromFile(String versionId, File file) =>
      deleteFromHash(versionId, Hash.sha512(sha512.convert(file.readAsBytesSync()).toString()));

  Future<void> deleteFromHash(String versionId, Hash hash) => _client
      .delete("version_file/${hash.value}?algorithm=${hash.algorithm}&version_id=$versionId".uri)
      .errorsOn(const {401}).expect(const {204});

  Future<ModrinthVersion?> getLatestVersionFromFile(
    File file, {
    List<String> loaders = const [],
    List<String> gameVersions = const [],
  }) {
    return getLatestVersionFromHash(
      Hash.sha512(sha512.convert(file.readAsBytesSync()).toString()),
      loaders: loaders,
      gameVersions: gameVersions,
    );
  }

  Future<ModrinthVersion?> getLatestVersionFromHash(
    Hash hash, {
    List<String> loaders = const [],
    List<String> gameVersions = const [],
  }) {
    return _client.postJson(
      "version_file/${hash.value}/update?algorithm=${hash.algorithm}".uri,
      {"loaders": loaders, "game_versions": gameVersions},
    ).expect(const {200, 404}).parseOrNull<JsonObject, ModrinthVersion>(ModrinthVersion.fromJson);
  }

  Future<Map<Hash, ModrinthVersion>> getMultipleVersionsFromHashes(List<Hash> hashes) async {
    if (hashes.isEmpty) return const {};

    final algorithm = hashes.first.algorithm;
    if (hashes.any((element) => element.algorithm != algorithm)) {
      throw ArgumentError("All hashes must share the same algorithm", "hashes");
    }

    return _client.postJson("version_files".uri, {
      "hashes": hashes.map((e) => e.value).toList(),
      "algorithm": algorithm,
    }).expect(const {200}).parse<JsonObject, Map<Hash, ModrinthVersion>>((json) {
      final map = <Hash, ModrinthVersion>{};
      json.forEach((key, value) {
        map[Hash._(key, algorithm)] = ModrinthVersion.fromJson(value as JsonObject);
      });
      return map;
    });
  }

  Future<Map<Hash, ModrinthVersion>> getLatestVersionsFromHashes(
    List<Hash> hashes, {
    List<String> loaders = const [],
    List<String> gameVersions = const [],
  }) async {
    if (hashes.isEmpty) return const {};

    final algorithm = hashes.first.algorithm;
    if (hashes.any((element) => element.algorithm != algorithm)) {
      throw ArgumentError("All hashes must share the same algorithm", "hashes");
    }

    return _client.postJson("version_files/update".uri, {
      "hashes": hashes.map((e) => e.value).toList(),
      "algorithm": algorithm,
      "loaders": loaders,
      "game_versions": gameVersions,
    }).expect(const {200}).parse<JsonObject, Map<Hash, ModrinthVersion>>((json) {
      final map = <Hash, ModrinthVersion>{};
      json.forEach((key, value) {
        map[Hash._(key, algorithm)] = ModrinthVersion.fromJson(value as JsonObject);
      });
      return map;
    });
  }
}

final class Hash {
  final String value;
  final String algorithm;
  Hash._(this.value, this.algorithm);

  factory Hash.sha1(String value) => Hash._(value, "sha1");
  factory Hash.sha512(String value) => Hash._(value, "sha512");

  @override
  bool operator ==(Object other) {
    return other is Hash && other.value == value && other.algorithm == algorithm;
  }

  @override
  int get hashCode => Object.hash(value, algorithm);

  @override
  String toString() => value;
}
