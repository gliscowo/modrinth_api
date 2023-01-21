// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModrinthVersion _$ModrinthVersionFromJson(Map<String, dynamic> json) =>
    ModrinthVersion(
      json['name'] as String,
      json['version_number'] as String,
      json['changelog'] as String?,
      (json['dependencies'] as List<dynamic>?)
          ?.map((e) => ModrinthDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['game_versions'] as List<dynamic>).map((e) => e as String).toList(),
      $enumDecode(_$ModrinthVersionTypeEnumMap, json['version_type']),
      (json['loaders'] as List<dynamic>).map((e) => e as String).toList(),
      json['featured'] as bool,
      json['id'] as String,
      json['project_id'] as String,
      json['author_id'] as String,
      json['date_published'] as String,
      json['downloads'] as int,
      (json['files'] as List<dynamic>)
          .map((e) => ModrinthFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModrinthVersionToJson(ModrinthVersion instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version_number': instance.versionNumber,
      'changelog': instance.changelog,
      'dependencies': instance.dependencies,
      'game_versions': instance.gameVersions,
      'version_type': _$ModrinthVersionTypeEnumMap[instance.versionType],
      'loaders': instance.loaders,
      'featured': instance.featured,
      'id': instance.id,
      'project_id': instance.projectId,
      'author_id': instance.authorId,
      'date_published': instance.datePublished,
      'downloads': instance.downloads,
      'files': instance.files,
    };

const _$ModrinthVersionTypeEnumMap = {
  ModrinthVersionType.release: 'release',
  ModrinthVersionType.beta: 'beta',
  ModrinthVersionType.alpha: 'alpha',
};

ModrinthDependency _$ModrinthDependencyFromJson(Map<String, dynamic> json) =>
    ModrinthDependency(
      json['version_id'] as String?,
      json['project_id'] as String?,
      json['dependency_type'] as String,
    );

Map<String, dynamic> _$ModrinthDependencyToJson(ModrinthDependency instance) =>
    <String, dynamic>{
      'version_id': instance.versionId,
      'project_id': instance.projectId,
      'dependency_type': instance.dependencyType,
    };

ModrinthFile _$ModrinthFileFromJson(Map<String, dynamic> json) => ModrinthFile(
      Map<String, String>.from(json['hashes'] as Map),
      json['url'] as String,
      json['filename'] as String,
      json['primary'] as bool,
    );

Map<String, dynamic> _$ModrinthFileToJson(ModrinthFile instance) =>
    <String, dynamic>{
      'hashes': instance.hashes,
      'url': instance.url,
      'filename': instance.filename,
      'primary': instance.primary,
    };

ModrinthSearchResult _$ModrinthSearchResultFromJson(
        Map<String, dynamic> json) =>
    ModrinthSearchResult(
      json['slug'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList(),
      $enumDecodeNullable(_$ModrinthSideSupportEnumMap, json['client_side']),
      $enumDecodeNullable(_$ModrinthSideSupportEnumMap, json['server_side']),
      json['project_type'] as String,
      json['downloads'] as int,
      json['icon_url'] as String?,
      json['project_id'] as String,
      json['author'] as String,
      (json['versions'] as List<dynamic>).map((e) => e as String).toList(),
      json['follows'] as int,
      json['date_created'] as String,
      json['date_modified'] as String,
      json['latest_version'] as String?,
      json['license'] as String,
      (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ModrinthSearchResultToJson(
        ModrinthSearchResult instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'title': instance.title,
      'description': instance.description,
      'categories': instance.categories,
      'client_side': _$ModrinthSideSupportEnumMap[instance.clientSide],
      'server_side': _$ModrinthSideSupportEnumMap[instance.serverSide],
      'project_type': instance.projectType,
      'downloads': instance.downloads,
      'icon_url': instance.iconUrl,
      'project_id': instance.projectId,
      'author': instance.author,
      'versions': instance.versions,
      'follows': instance.follows,
      'date_created': instance.dateCreated,
      'date_modified': instance.dateModified,
      'latest_version': instance.latestVersion,
      'license': instance.license,
      'gallery': instance.gallery,
    };

const _$ModrinthSideSupportEnumMap = {
  ModrinthSideSupport.required: 'required',
  ModrinthSideSupport.optional: 'optional',
  ModrinthSideSupport.unsupported: 'unsupported',
};

ModrinthUser _$ModrinthUserFromJson(Map<String, dynamic> json) => ModrinthUser(
      json['username'] as String,
      json['name'] as String?,
      json['email'] as String?,
      json['bio'] as String?,
      json['id'] as String,
      json['github_id'] as int,
      json['avatar_url'] as String,
      json['created'] as String,
      $enumDecode(_$ModrinthUserRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$ModrinthUserToJson(ModrinthUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'id': instance.id,
      'github_id': instance.githubId,
      'avatar_url': instance.avatarUrl,
      'created': instance.created,
      'role': _$ModrinthUserRoleEnumMap[instance.role],
    };

const _$ModrinthUserRoleEnumMap = {
  ModrinthUserRole.admin: 'admin',
  ModrinthUserRole.moderator: 'moderator',
  ModrinthUserRole.developer: 'developer',
};

ModrinthProject _$ModrinthProjectFromJson(Map<String, dynamic> json) =>
    ModrinthProject(
      json['slug'] as String,
      json['title'] as String,
      json['description'] as String,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      $enumDecode(_$ModrinthSideSupportEnumMap, json['client_side']),
      $enumDecode(_$ModrinthSideSupportEnumMap, json['server_side']),
      json['body'] as String,
      json['issues_url'] as String?,
      json['source_url'] as String?,
      json['wiki_url'] as String?,
      json['discord_url'] as String?,
      json['donations_url'] as String?,
      $enumDecode(_$ModrinthProjectTypeEnumMap, json['project_type']),
      json['downloads'] as int,
      json['icon_url'] as String?,
      json['id'] as String,
      json['team'] as String,
      json['moderator_message'] == null
          ? null
          : ModrinthModeratorMessage.fromJson(
              json['moderator_message'] as Map<String, dynamic>),
      json['published'] as String,
      json['updated'] as String,
      json['followers'] as int,
      $enumDecode(_$ModrinthProjectStatusEnumMap, json['status']),
      json['license'] == null
          ? null
          : ModrinthLicense.fromJson(json['license'] as Map<String, dynamic>),
      (json['versions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['gallery'] as List<dynamic>?)
          ?.map((e) => ModrinthGalleryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModrinthProjectToJson(ModrinthProject instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'title': instance.title,
      'description': instance.description,
      'categories': instance.categories,
      'client_side': _$ModrinthSideSupportEnumMap[instance.clientSide],
      'server_side': _$ModrinthSideSupportEnumMap[instance.serverSide],
      'body': instance.body,
      'issues_url': instance.issuesUrl,
      'source_url': instance.sourceUrl,
      'wiki_url': instance.wikiUrl,
      'discord_url': instance.discordUrl,
      'donations_url': instance.donationsUrl,
      'project_type': _$ModrinthProjectTypeEnumMap[instance.projectType],
      'downloads': instance.downloads,
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'team': instance.team,
      'moderator_message': instance.moderatorMessage,
      'published': instance.published,
      'updated': instance.updated,
      'followers': instance.followers,
      'status': _$ModrinthProjectStatusEnumMap[instance.status],
      'license': instance.license,
      'versions': instance.versions,
      'gallery': instance.gallery,
    };

const _$ModrinthProjectTypeEnumMap = {
  ModrinthProjectType.mod: 'mod',
  ModrinthProjectType.modpack: 'modpack',
};

const _$ModrinthProjectStatusEnumMap = {
  ModrinthProjectStatus.approved: 'approved',
  ModrinthProjectStatus.rejected: 'rejected',
  ModrinthProjectStatus.draft: 'draft',
  ModrinthProjectStatus.unlisted: 'unlisted',
  ModrinthProjectStatus.archived: 'archived',
  ModrinthProjectStatus.processing: 'processing',
  ModrinthProjectStatus.unknown: 'unknown',
};

ModrinthGalleryEntry _$ModrinthGalleryEntryFromJson(
        Map<String, dynamic> json) =>
    ModrinthGalleryEntry(
      json['url'] as String,
      json['featured'] as bool,
      json['title'] as String?,
      json['description'] as String?,
      json['created'] as String,
    );

Map<String, dynamic> _$ModrinthGalleryEntryToJson(
        ModrinthGalleryEntry instance) =>
    <String, dynamic>{
      'url': instance.url,
      'featured': instance.featured,
      'title': instance.title,
      'description': instance.description,
      'created': instance.created,
    };

ModrinthLicense _$ModrinthLicenseFromJson(Map<String, dynamic> json) =>
    ModrinthLicense(
      json['id'] as String?,
      json['name'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ModrinthLicenseToJson(ModrinthLicense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };

ModrinthModeratorMessage _$ModrinthModeratorMessageFromJson(
        Map<String, dynamic> json) =>
    ModrinthModeratorMessage(
      json['message'] as String,
      json['body'] as String?,
    );

Map<String, dynamic> _$ModrinthModeratorMessageToJson(
        ModrinthModeratorMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'body': instance.body,
    };
