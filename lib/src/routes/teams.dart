import 'package:modrinth_api/src/client.dart';

import '../models/request_models.dart';
import '../models/response_models.dart';
import '../modrinth_api_base.dart';

class Teams {
  final ModrinthApiClient _client;
  Teams(this._client);

  Future<Iterable<ModrinthTeamMember>> getTeam(String projectIdOrSlug) => _client
      .get("project/$projectIdOrSlug/members".uri)
      .expect(const {200}).parse<JsonArray, Iterable<ModrinthTeamMember>>(
          (json) => json.cast<JsonObject>().map(ModrinthTeamMember.fromJson));

  Future<Iterable<ModrinthTeamMember>> getMembers(String id) =>
      _client.get("team/$id/members".uri).expect(const {200}).parse<JsonArray, Iterable<ModrinthTeamMember>>(
          (json) => json.cast<JsonObject>().map(ModrinthTeamMember.fromJson));

  Future<void> inviteMember(String id, String userId) =>
      _client.postJson("team/$id/members".uri, {"user_id": userId}).errorsOn(const {401}).expect(const {204});

  Future<void> join(String id) => _client.post("team/$id/join".uri).errorsOn(const {401}).expect(const {204});

  Future<void> modifyMemberPermissions(String id, String userId, ModifyTeamMember request) =>
      _client.patchJson("team/$id/members/$userId".uri, request.toJson()).errorsOn(const {401}).expect(const {204});

  Future<void> removeMember(String id, String userId) =>
      _client.delete("team/$id/members/$userId".uri).errorsOn(const {401}).expect(const {204});

  Future<void> transferOwnership(String id, String newOwnerUserId) =>
      _client.patchJson("team/$id/owner".uri, {"user_id": newOwnerUserId}).errorsOn(const {401}).expect(const {204});
}
