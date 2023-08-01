import 'package:modrinth_api/src/client.dart';

import '../models/response_models.dart';
import '../modrinth_api_base.dart';

class Tags {
  final ModrinthApiClient _client;
  Tags(this._client);

  Future<Iterable<ModrinthCategory>> getCategories() =>
      _client.get("tag/category".uri).expect(const {200}).parse<JsonArray, Iterable<ModrinthCategory>>(
          (json) => json.cast<JsonObject>().map(ModrinthCategory.fromJson));

  Future<Iterable<ModrinthLoader>> getLoaders() =>
      _client.get("tag/loader".uri).expect(const {200}).parse<JsonArray, Iterable<ModrinthLoader>>(
          (json) => json.cast<JsonObject>().map(ModrinthLoader.fromJson));

  Future<Iterable<ModrinthGameVersion>> getGameVersions() =>
      _client.get("tag/game_version".uri).expect(const {200}).parse<JsonArray, Iterable<ModrinthGameVersion>>(
          (json) => json.cast<JsonObject>().map(ModrinthGameVersion.fromJson));

  Future<Iterable<ModrinthLicenseIdentifier>> getLicenseIdentifiers() =>
      _client.get("tag/license".uri).expect(const {200}).parse<JsonArray, Iterable<ModrinthLicenseIdentifier>>(
          (json) => json.cast<JsonObject>().map(ModrinthLicenseIdentifier.fromJson));

  Future<Iterable<ModrinthDonationPlatform>> getDonationPlatforms() =>
      _client.get("tag/donation_platform".uri).expect(const {200}).parse<JsonArray, Iterable<ModrinthDonationPlatform>>(
          (json) => json.cast<JsonObject>().map(ModrinthDonationPlatform.fromJson));

  Future<Iterable<String>> getReportTypes() => _client
      .get("tag/report_type".uri)
      .expect(const {200}).parse<JsonArray, Iterable<String>>((json) => json.cast<String>());
}
