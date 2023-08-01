import 'package:json_annotation/json_annotation.dart';
import 'package:modrinth_api/src/models/response_models.dart';

import '../modrinth_api_base.dart';

part 'request_models.g.dart';

@JsonSerializable(createFactory: false)
class ModifyProject {
  final String? slug;
  final String? title;
  final String? description;
  final List<String>? categories;
  final ModrinthSideSupport? clientSide;
  final ModrinthSideSupport? serverSide;
  final String? body;
  final List<String>? additionalCategories;
  final String? issuesUrl;
  final String? sourceUrl;
  final String? wikiUrl;
  final String? discordUrl;
  final List<ModrinthDonationUrl>? donationUrls;
  final String? licenseId;
  final String? licenseUrl;
  final ModrinthProjectStatus? status;
  final ModrinthProjectStatus? requestedStatus;
  final String? moderationMessage;
  final String? moderationMessageBody;

  const ModifyProject({
    this.slug,
    this.title,
    this.description,
    this.categories,
    this.clientSide,
    this.serverSide,
    this.body,
    this.additionalCategories,
    this.issuesUrl,
    this.sourceUrl,
    this.wikiUrl,
    this.discordUrl,
    this.donationUrls,
    this.licenseId,
    this.licenseUrl,
    this.status,
    this.requestedStatus,
    this.moderationMessage,
    this.moderationMessageBody,
  });

  Map<String, dynamic> toJson() => _$ModifyProjectToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable(createFactory: false)
class EditMultipleProjects {
  final List<String>? categories;
  final List<String>? addCategories;
  final List<String>? removeCategories;
  final List<String>? additionalCategories;
  final List<String>? addAdditionalCategories;
  final List<String>? removeAdditionalCategories;
  final List<ModrinthDonationUrl>? donationUrls;
  final List<ModrinthDonationUrl>? addDonationUrls;
  final List<ModrinthDonationUrl>? removeDonationUrls;
  final String? issuesUrl;
  final String? sourceUrl;
  final String? wikiUrl;
  final String? discordUrl;

  const EditMultipleProjects({
    this.categories,
    this.addCategories,
    this.removeCategories,
    this.additionalCategories,
    this.addAdditionalCategories,
    this.removeAdditionalCategories,
    this.donationUrls,
    this.addDonationUrls,
    this.removeDonationUrls,
    this.issuesUrl,
    this.sourceUrl,
    this.wikiUrl,
    this.discordUrl,
  });

  Map<String, dynamic> toJson() => _$EditMultipleProjectsToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable(createFactory: false)
class CreateProject {
  final String slug;
  final String title;
  final String description;
  final List<String> categories;
  final ModrinthSideSupport clientSide;
  final ModrinthSideSupport serverSide;
  final String body;
  final List<String>? additionalCategories;
  final String? issuesUrl;
  final String? sourceUrl;
  final String? wikiUrl;
  final String? discordUrl;
  final List<ModrinthDonationUrl>? donationUrls;
  final String licenseId;
  final String? licenseUrl;
  final ModrinthProjectType projectType;

  const CreateProject(
    this.slug,
    this.title,
    this.description,
    this.categories,
    this.clientSide,
    this.serverSide,
    this.body,
    this.licenseId,
    this.projectType, {
    this.additionalCategories,
    this.issuesUrl,
    this.sourceUrl,
    this.wikiUrl,
    this.discordUrl,
    this.donationUrls,
    this.licenseUrl,
  });

  Map<String, dynamic> toJson() => _$CreateProjectToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable(createFactory: false)
class ModifyVersion {
  final String? name;
  final String? versionNumber;
  final String? changelog;
  final List<ModrinthDependency>? dependencies;
  final List<String>? gameVersions;
  final ModrinthVersionType? versionType;
  final List<String>? loaders;
  final bool? featured;
  final ModrinthVersionStatus? status;
  final ModrinthVersionStatus? requestedStatus;
  @JsonKey(toJson: _primaryFileToJson)
  final (String, String)? primaryFile;

  ModifyVersion({
    this.name,
    this.versionNumber,
    this.changelog,
    this.dependencies,
    this.gameVersions,
    this.versionType,
    this.loaders,
    this.featured,
    this.status,
    this.requestedStatus,
    this.primaryFile,
  });

  Map<String, dynamic> toJson() => _$ModifyVersionToJson(this);

  @override
  String toString() => encoder.convert(toJson());

  static List<String>? _primaryFileToJson((String, String)? primaryFile) =>
      primaryFile != null ? [primaryFile.$1, primaryFile.$2] : null;
}

@JsonSerializable(createFactory: false)
class CreateVersion {
  final String name;
  final String versionNumber;
  final String? changelog;
  final List<CreateDependency> dependencies;
  final List<String>? gameVersions;
  final ModrinthVersionType versionType;
  final List<String> loaders;
  final bool featured;
  final ModrinthVersionStatus? status;
  final ModrinthVersionStatus? requestedStatus;
  final String projectId;
  final List<String> fileParts;
  final String primaryFile;

  CreateVersion(
    this.name,
    this.versionNumber,
    this.dependencies,
    this.versionType,
    this.loaders,
    this.featured,
    this.projectId,
    this.fileParts,
    this.primaryFile, {
    this.changelog,
    this.gameVersions,
    this.status,
    this.requestedStatus,
  });

  Map<String, dynamic> toJson() => _$CreateVersionToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class CreateDependency {
  final String versionId;
  final String projectId;
  final String? fileName;
  final ModrinthDependencyType dependencyType;

  CreateDependency(
    this.versionId,
    this.projectId,
    this.dependencyType, {
    this.fileName,
  });
}

@JsonSerializable()
class ModifyUser {
  final String username;
  final String? name;
  final String? email;
  final String? bio;
  final ModrinthPayoutData? payoutData;

  ModifyUser(
    this.username, {
    this.name,
    this.email,
    this.bio,
    this.payoutData,
  });

  Map<String, dynamic> toJson() => _$ModifyUserToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModifyTeamMember {
  final String? role;
  @JsonKey(toJson: ModrinthPermissions.toJson)
  final ModrinthPermissions? permissions;
  final int? payoutsSplit;
  final int? ordering;

  ModifyTeamMember({
    this.role,
    this.permissions,
    this.payoutsSplit,
    this.ordering,
  });

  Map<String, dynamic> toJson() => _$ModifyTeamMemberToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthSearchIndexType {
  relevance,
  downloads,
  follows,
  newest,
  updated,
}
