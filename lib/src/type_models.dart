import 'package:json_annotation/json_annotation.dart';

import 'modrinth_api_base.dart';

part 'type_models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthVersion {
  final String name;
  final String versionNumber;
  final String? changelog;

  final List<ModrinthDependency>? dependencies;

  final List<String> gameVersions;
  final ModrinthVersionType versionType;
  final List<String> loaders;
  final bool featured;
  final String id;
  final String projectId;
  final String authorId;
  final String datePublished;
  final int downloads;
  final List<ModrinthFile> files;

  ModrinthVersion(
      this.name,
      this.versionNumber,
      this.changelog,
      this.dependencies,
      this.gameVersions,
      this.versionType,
      this.loaders,
      this.featured,
      this.id,
      this.projectId,
      this.authorId,
      this.datePublished,
      this.downloads,
      this.files);

  factory ModrinthVersion.fromJson(Map<String, dynamic> json) => _$ModrinthVersionFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthVersionToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthVersionType { release, beta, alpha }

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthDependency {
  final String? versionId;
  final String? projectId;
  final String dependencyType;

  ModrinthDependency(this.versionId, this.projectId, this.dependencyType);

  factory ModrinthDependency.fromJson(Map<String, dynamic> json) => _$ModrinthDependencyFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthDependencyToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthFile {
  final Map<String, String> hashes;
  final String url;
  final String filename;
  final bool primary;

  ModrinthFile(this.hashes, this.url, this.filename, this.primary);

  factory ModrinthFile.fromJson(Map<String, dynamic> json) => _$ModrinthFileFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthFileToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthSearchResult {
  final String? slug;
  final String? title;
  final String? description;
  final List<String>? categories;
  final ModrinthSideSupport? clientSide;
  final ModrinthSideSupport? serverSide;
  final String projectType;
  final int downloads;
  final String? iconUrl;
  final String projectId;
  final String author;
  final List<String> versions;
  final int follows;
  final String dateCreated;
  final String dateModified;
  final String? latestVersion;
  final String license;
  final List<String>? gallery;

  ModrinthSearchResult(
      this.slug,
      this.title,
      this.description,
      this.categories,
      this.clientSide,
      this.serverSide,
      this.projectType,
      this.downloads,
      this.iconUrl,
      this.projectId,
      this.author,
      this.versions,
      this.follows,
      this.dateCreated,
      this.dateModified,
      this.latestVersion,
      this.license,
      this.gallery);

  factory ModrinthSearchResult.fromJson(Map<String, dynamic> json) => _$ModrinthSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthSearchResultToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthSideSupport { required, optional, unsupported }

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthUser {
  final String username;
  final String? name;
  final String? email;
  final String? bio;
  final String id;
  final int githubId;
  final String avatarUrl;
  final String created;
  final ModrinthUserRole role;

  ModrinthUser(
      this.username, this.name, this.email, this.bio, this.id, this.githubId, this.avatarUrl, this.created, this.role);

  factory ModrinthUser.fromJson(Map<String, dynamic> json) => _$ModrinthUserFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthUserToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthUserRole { admin, moderator, developer }

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthProject {
  final String slug;
  final String title;
  final String description;
  final List<String> categories;
  final ModrinthSideSupport clientSide;
  final ModrinthSideSupport serverSide;
  final String body;
  final String? issuesUrl;
  final String? sourceUrl;
  final String? wikiUrl;
  final String? discordUrl;
  final String? donationsUrl;
  final ModrinthProjectType projectType;
  final int downloads;
  final String? iconUrl;
  final String id;
  final String team;
  final String? moderatorMessage;
  final String published;
  final String updated;
  final int followers;
  final ModrinthProjectStatus status;
  final ModrinthLicense? license;
  final List<String>? versions;
  final List<ModrinthGalleryEntry>? gallery;

  ModrinthProject(
      this.slug,
      this.title,
      this.description,
      this.categories,
      this.clientSide,
      this.serverSide,
      this.body,
      this.issuesUrl,
      this.sourceUrl,
      this.wikiUrl,
      this.discordUrl,
      this.donationsUrl,
      this.projectType,
      this.downloads,
      this.iconUrl,
      this.id,
      this.team,
      this.moderatorMessage,
      this.published,
      this.updated,
      this.followers,
      this.status,
      this.license,
      this.versions,
      this.gallery);

  factory ModrinthProject.fromJson(Map<String, dynamic> json) => _$ModrinthProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthProjectToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthGalleryEntry {
  final String url;
  final bool featured;
  final String? title;
  final String? description;
  final String created;

  ModrinthGalleryEntry(this.url, this.featured, this.title, this.description, this.created);

  factory ModrinthGalleryEntry.fromJson(Map<String, dynamic> json) => _$ModrinthGalleryEntryFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthGalleryEntryToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthLicense {
  final String? id;
  final String? name;
  final String? url;

  ModrinthLicense(this.id, this.name, this.url);

  factory ModrinthLicense.fromJson(Map<String, dynamic> json) => _$ModrinthLicenseFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthLicenseToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthProjectStatus { approved, rejected, draft, unlisted, archived, processing, unknown }

enum ModrinthProjectType { mod, modpack }
