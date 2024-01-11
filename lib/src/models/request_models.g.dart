// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ModifyProjectToJson(ModifyProject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('slug', instance.slug);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('categories', instance.categories);
  writeNotNull(
      'client_side', _$ModrinthSideSupportEnumMap[instance.clientSide]);
  writeNotNull(
      'server_side', _$ModrinthSideSupportEnumMap[instance.serverSide]);
  writeNotNull('body', instance.body);
  writeNotNull('additional_categories', instance.additionalCategories);
  writeNotNull('issues_url', instance.issuesUrl);
  writeNotNull('source_url', instance.sourceUrl);
  writeNotNull('wiki_url', instance.wikiUrl);
  writeNotNull('discord_url', instance.discordUrl);
  writeNotNull('donation_urls', instance.donationUrls);
  writeNotNull('license_id', instance.licenseId);
  writeNotNull('license_url', instance.licenseUrl);
  writeNotNull('status', _$ModrinthProjectStatusEnumMap[instance.status]);
  writeNotNull('requested_status',
      _$ModrinthProjectStatusEnumMap[instance.requestedStatus]);
  writeNotNull('moderation_message', instance.moderationMessage);
  writeNotNull('moderation_message_body', instance.moderationMessageBody);
  return val;
}

const _$ModrinthSideSupportEnumMap = {
  ModrinthSideSupport.required: 'required',
  ModrinthSideSupport.optional: 'optional',
  ModrinthSideSupport.unsupported: 'unsupported',
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

Map<String, dynamic> _$EditMultipleProjectsToJson(
    EditMultipleProjects instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('categories', instance.categories);
  writeNotNull('add_categories', instance.addCategories);
  writeNotNull('remove_categories', instance.removeCategories);
  writeNotNull('additional_categories', instance.additionalCategories);
  writeNotNull('add_additional_categories', instance.addAdditionalCategories);
  writeNotNull(
      'remove_additional_categories', instance.removeAdditionalCategories);
  writeNotNull('donation_urls', instance.donationUrls);
  writeNotNull('add_donation_urls', instance.addDonationUrls);
  writeNotNull('remove_donation_urls', instance.removeDonationUrls);
  writeNotNull('issues_url', instance.issuesUrl);
  writeNotNull('source_url', instance.sourceUrl);
  writeNotNull('wiki_url', instance.wikiUrl);
  writeNotNull('discord_url', instance.discordUrl);
  return val;
}

Map<String, dynamic> _$CreateProjectToJson(CreateProject instance) {
  final val = <String, dynamic>{
    'slug': instance.slug,
    'title': instance.title,
    'description': instance.description,
    'categories': instance.categories,
    'client_side': _$ModrinthSideSupportEnumMap[instance.clientSide]!,
    'server_side': _$ModrinthSideSupportEnumMap[instance.serverSide]!,
    'body': instance.body,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additional_categories', instance.additionalCategories);
  writeNotNull('issues_url', instance.issuesUrl);
  writeNotNull('source_url', instance.sourceUrl);
  writeNotNull('wiki_url', instance.wikiUrl);
  writeNotNull('discord_url', instance.discordUrl);
  writeNotNull('donation_urls', instance.donationUrls);
  val['license_id'] = instance.licenseId;
  writeNotNull('license_url', instance.licenseUrl);
  val['project_type'] = _$ModrinthProjectTypeEnumMap[instance.projectType]!;
  val['initial_versions'] = instance.initialVersions;
  val['is_draft'] = instance.isDraft;
  val['gallery_items'] = instance.galleryItems;
  return val;
}

const _$ModrinthProjectTypeEnumMap = {
  ModrinthProjectType.mod: 'mod',
  ModrinthProjectType.modpack: 'modpack',
  ModrinthProjectType.resourcepack: 'resourcepack',
  ModrinthProjectType.shader: 'shader',
  ModrinthProjectType.plugin: 'plugin',
  ModrinthProjectType.datapack: 'datapack',
  ModrinthProjectType.project: 'project',
};

Map<String, dynamic> _$ModifyVersionToJson(ModifyVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('version_number', instance.versionNumber);
  writeNotNull('changelog', instance.changelog);
  writeNotNull('dependencies', instance.dependencies);
  writeNotNull('game_versions', instance.gameVersions);
  writeNotNull(
      'version_type', _$ModrinthVersionTypeEnumMap[instance.versionType]);
  writeNotNull('loaders', instance.loaders);
  writeNotNull('featured', instance.featured);
  writeNotNull('status', _$ModrinthVersionStatusEnumMap[instance.status]);
  writeNotNull('requested_status',
      _$ModrinthVersionStatusEnumMap[instance.requestedStatus]);
  writeNotNull(
      'primary_file', ModifyVersion._primaryFileToJson(instance.primaryFile));
  return val;
}

const _$ModrinthVersionTypeEnumMap = {
  ModrinthVersionType.release: 'release',
  ModrinthVersionType.beta: 'beta',
  ModrinthVersionType.alpha: 'alpha',
};

const _$ModrinthVersionStatusEnumMap = {
  ModrinthVersionStatus.listed: 'listed',
  ModrinthVersionStatus.archived: 'archived',
  ModrinthVersionStatus.draft: 'draft',
  ModrinthVersionStatus.unlisted: 'unlisted',
  ModrinthVersionStatus.scheduled: 'scheduled',
  ModrinthVersionStatus.unknown: 'unknown',
};

Map<String, dynamic> _$CreateVersionToJson(CreateVersion instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'version_number': instance.versionNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('changelog', instance.changelog);
  val['dependencies'] = instance.dependencies;
  val['game_versions'] = instance.gameVersions;
  val['version_type'] = _$ModrinthVersionTypeEnumMap[instance.versionType]!;
  val['loaders'] = instance.loaders;
  val['featured'] = instance.featured;
  writeNotNull('status', _$ModrinthVersionStatusEnumMap[instance.status]);
  writeNotNull('requested_status',
      _$ModrinthVersionStatusEnumMap[instance.requestedStatus]);
  val['project_id'] = instance.projectId;
  val['file_parts'] = instance.fileParts;
  val['primary_file'] = instance.primaryFile;
  return val;
}

Map<String, dynamic> _$CreateDependencyToJson(CreateDependency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version_id', instance.versionId);
  writeNotNull('file_name', instance.fileName);
  val['project_id'] = instance.projectId;
  val['dependency_type'] =
      _$ModrinthDependencyTypeEnumMap[instance.dependencyType]!;
  return val;
}

const _$ModrinthDependencyTypeEnumMap = {
  ModrinthDependencyType.required: 'required',
  ModrinthDependencyType.optional: 'optional',
  ModrinthDependencyType.incompatible: 'incompatible',
  ModrinthDependencyType.embedded: 'embedded',
};

Map<String, dynamic> _$ModifyUserToJson(ModifyUser instance) {
  final val = <String, dynamic>{
    'username': instance.username,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('bio', instance.bio);
  writeNotNull('payout_data', instance.payoutData);
  return val;
}

Map<String, dynamic> _$ModifyTeamMemberToJson(ModifyTeamMember instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', instance.role);
  writeNotNull('permissions', ModrinthPermissions.toJson(instance.permissions));
  writeNotNull('payouts_split', instance.payoutsSplit);
  writeNotNull('ordering', instance.ordering);
  return val;
}
