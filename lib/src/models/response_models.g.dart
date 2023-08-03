// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModrinthProject _$ModrinthProjectFromJson(Map<String, dynamic> json) =>
    ModrinthProject(
      json['slug'] as String,
      json['title'] as String,
      json['description'] as String,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      $enumDecode(_$ModrinthSideSupportEnumMap, json['client_side']),
      $enumDecode(_$ModrinthSideSupportEnumMap, json['server_side']),
      json['body'] as String,
      (json['additional_categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['issues_url'] as String?,
      json['source_url'] as String?,
      json['wiki_url'] as String?,
      json['discord_url'] as String?,
      (json['donation_urls'] as List<dynamic>?)
          ?.map((e) => ModrinthDonationUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecode(_$ModrinthProjectTypeEnumMap, json['project_type']),
      json['downloads'] as int,
      json['icon_url'] as String?,
      json['color'] as int?,
      json['id'] as String,
      json['team'] as String,
      json['moderator_message'] == null
          ? null
          : ModrinthModeratorMessage.fromJson(
              json['moderator_message'] as Map<String, dynamic>),
      json['published'] as String,
      json['updated'] as String,
      json['approved'] as String?,
      json['followers'] as int,
      $enumDecode(_$ModrinthProjectStatusEnumMap, json['status']),
      json['license'] == null
          ? null
          : ModrinthLicense.fromJson(json['license'] as Map<String, dynamic>),
      (json['versions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['game_versions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['loaders'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['gallery'] as List<dynamic>?)
          ?.map((e) => ModrinthGalleryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModrinthProjectToJson(ModrinthProject instance) {
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
  val['project_type'] = _$ModrinthProjectTypeEnumMap[instance.projectType]!;
  val['downloads'] = instance.downloads;
  writeNotNull('icon_url', instance.iconUrl);
  writeNotNull('color', instance.color);
  val['id'] = instance.id;
  val['team'] = instance.team;
  writeNotNull('moderator_message', instance.moderatorMessage);
  val['published'] = instance.published;
  val['updated'] = instance.updated;
  writeNotNull('approved', instance.approved);
  val['followers'] = instance.followers;
  val['status'] = _$ModrinthProjectStatusEnumMap[instance.status]!;
  writeNotNull('license', instance.license);
  writeNotNull('versions', instance.versions);
  writeNotNull('game_versions', instance.gameVersions);
  writeNotNull('loaders', instance.loaders);
  writeNotNull('gallery', instance.gallery);
  return val;
}

const _$ModrinthSideSupportEnumMap = {
  ModrinthSideSupport.required: 'required',
  ModrinthSideSupport.optional: 'optional',
  ModrinthSideSupport.unsupported: 'unsupported',
};

const _$ModrinthProjectTypeEnumMap = {
  ModrinthProjectType.mod: 'mod',
  ModrinthProjectType.modpack: 'modpack',
  ModrinthProjectType.resourcepack: 'resourcepack',
  ModrinthProjectType.shader: 'shader',
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

ModrinthDonationUrl _$ModrinthDonationUrlFromJson(Map<String, dynamic> json) =>
    ModrinthDonationUrl(
      id: json['id'] as String?,
      platform: json['platform'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ModrinthDonationUrlToJson(ModrinthDonationUrl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('platform', instance.platform);
  writeNotNull('url', instance.url);
  return val;
}

ModrinthGalleryEntry _$ModrinthGalleryEntryFromJson(
        Map<String, dynamic> json) =>
    ModrinthGalleryEntry(
      json['url'] as String,
      json['featured'] as bool,
      json['title'] as String?,
      json['description'] as String?,
      json['created'] as String,
      json['ordering'] as int?,
    );

Map<String, dynamic> _$ModrinthGalleryEntryToJson(
    ModrinthGalleryEntry instance) {
  final val = <String, dynamic>{
    'url': instance.url,
    'featured': instance.featured,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  val['created'] = instance.created;
  writeNotNull('ordering', instance.ordering);
  return val;
}

ModrinthLicense _$ModrinthLicenseFromJson(Map<String, dynamic> json) =>
    ModrinthLicense(
      json['id'] as String?,
      json['name'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ModrinthLicenseToJson(ModrinthLicense instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('url', instance.url);
  return val;
}

ModrinthModeratorMessage _$ModrinthModeratorMessageFromJson(
        Map<String, dynamic> json) =>
    ModrinthModeratorMessage(
      json['message'] as String,
      json['body'] as String?,
    );

Map<String, dynamic> _$ModrinthModeratorMessageToJson(
    ModrinthModeratorMessage instance) {
  final val = <String, dynamic>{
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('body', instance.body);
  return val;
}

ModrinthSearchResult _$ModrinthSearchResultFromJson(
        Map<String, dynamic> json) =>
    ModrinthSearchResult(
      json['slug'] as String,
      json['title'] as String,
      json['description'] as String,
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList(),
      $enumDecode(_$ModrinthSideSupportEnumMap, json['client_side']),
      $enumDecode(_$ModrinthSideSupportEnumMap, json['server_side']),
      json['project_type'] as String,
      json['downloads'] as int,
      json['icon_url'] as String?,
      json['color'] as int?,
      json['project_id'] as String,
      json['author'] as String,
      (json['display_categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['versions'] as List<dynamic>).map((e) => e as String).toList(),
      json['follows'] as int,
      json['date_created'] as String,
      json['date_modified'] as String,
      json['latest_version'] as String?,
      json['license'] as String,
      (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['feature_gallery'] as String?,
    );

Map<String, dynamic> _$ModrinthSearchResultToJson(
    ModrinthSearchResult instance) {
  final val = <String, dynamic>{
    'slug': instance.slug,
    'title': instance.title,
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('categories', instance.categories);
  val['client_side'] = _$ModrinthSideSupportEnumMap[instance.clientSide]!;
  val['server_side'] = _$ModrinthSideSupportEnumMap[instance.serverSide]!;
  val['project_type'] = instance.projectType;
  val['downloads'] = instance.downloads;
  writeNotNull('icon_url', instance.iconUrl);
  writeNotNull('color', instance.color);
  val['project_id'] = instance.projectId;
  val['author'] = instance.author;
  writeNotNull('display_categories', instance.displayCategories);
  val['versions'] = instance.versions;
  val['follows'] = instance.follows;
  val['date_created'] = instance.dateCreated;
  val['date_modified'] = instance.dateModified;
  writeNotNull('latest_version', instance.latestVersion);
  val['license'] = instance.license;
  writeNotNull('gallery', instance.gallery);
  writeNotNull('feature_gallery', instance.featureGallery);
  return val;
}

ModrinthSearchResponse _$ModrinthSearchResponseFromJson(
        Map<String, dynamic> json) =>
    ModrinthSearchResponse(
      (json['hits'] as List<dynamic>)
          .map((e) => ModrinthSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['limit'] as int,
      json['total_hits'] as int,
    );

Map<String, dynamic> _$ModrinthSearchResponseToJson(
        ModrinthSearchResponse instance) =>
    <String, dynamic>{
      'hits': instance.hits,
      'offset': instance.offset,
      'limit': instance.limit,
      'total_hits': instance.totalHits,
    };

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
      $enumDecodeNullable(_$ModrinthVersionStatusEnumMap, json['status']),
      $enumDecodeNullable(
          _$ModrinthVersionStatusEnumMap, json['requested_status']),
      json['id'] as String,
      json['project_id'] as String,
      json['author_id'] as String,
      json['date_published'] as String,
      json['downloads'] as int,
      (json['files'] as List<dynamic>)
          .map((e) => ModrinthFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModrinthVersionToJson(ModrinthVersion instance) {
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
  writeNotNull('dependencies', instance.dependencies);
  val['game_versions'] = instance.gameVersions;
  val['version_type'] = _$ModrinthVersionTypeEnumMap[instance.versionType]!;
  val['loaders'] = instance.loaders;
  val['featured'] = instance.featured;
  writeNotNull('status', _$ModrinthVersionStatusEnumMap[instance.status]);
  writeNotNull('requested_status',
      _$ModrinthVersionStatusEnumMap[instance.requestedStatus]);
  val['id'] = instance.id;
  val['project_id'] = instance.projectId;
  val['author_id'] = instance.authorId;
  val['date_published'] = instance.datePublished;
  val['downloads'] = instance.downloads;
  val['files'] = instance.files;
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

ModrinthDependency _$ModrinthDependencyFromJson(Map<String, dynamic> json) =>
    ModrinthDependency(
      json['version_id'] as String?,
      json['project_id'] as String?,
      json['file_name'] as String?,
      $enumDecode(_$ModrinthDependencyTypeEnumMap, json['dependency_type']),
    );

Map<String, dynamic> _$ModrinthDependencyToJson(ModrinthDependency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version_id', instance.versionId);
  writeNotNull('project_id', instance.projectId);
  writeNotNull('file_name', instance.fileName);
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

ModrinthFile _$ModrinthFileFromJson(Map<String, dynamic> json) => ModrinthFile(
      Map<String, String>.from(json['hashes'] as Map),
      json['url'] as String,
      json['filename'] as String,
      json['primary'] as bool,
      json['size'] as int,
      $enumDecodeNullable(_$ModrinthFileTypeEnumMap, json['file_type']),
    );

Map<String, dynamic> _$ModrinthFileToJson(ModrinthFile instance) {
  final val = <String, dynamic>{
    'hashes': instance.hashes,
    'url': instance.url,
    'filename': instance.filename,
    'primary': instance.primary,
    'size': instance.size,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_type', _$ModrinthFileTypeEnumMap[instance.fileType]);
  return val;
}

const _$ModrinthFileTypeEnumMap = {
  ModrinthFileType.requiredResourcePack: 'required-resource-pack',
  ModrinthFileType.optionalResourcePack: 'optional-resource-pack',
};

ModrinthUser _$ModrinthUserFromJson(Map<String, dynamic> json) => ModrinthUser(
      json['username'] as String,
      json['name'] as String?,
      json['email'] as String?,
      json['bio'] as String?,
      json['payout_data'] == null
          ? null
          : ModrinthPayoutData.fromJson(
              json['payout_data'] as Map<String, dynamic>),
      json['id'] as String,
      json['github_id'] as int?,
      json['avatar_url'] as String,
      json['created'] as String,
      $enumDecode(_$ModrinthUserRoleEnumMap, json['role']),
      json['badges'] as int?,
    );

Map<String, dynamic> _$ModrinthUserToJson(ModrinthUser instance) {
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
  val['id'] = instance.id;
  writeNotNull('github_id', instance.githubId);
  val['avatar_url'] = instance.avatarUrl;
  val['created'] = instance.created;
  val['role'] = _$ModrinthUserRoleEnumMap[instance.role]!;
  writeNotNull('badges', instance.badges);
  return val;
}

const _$ModrinthUserRoleEnumMap = {
  ModrinthUserRole.admin: 'admin',
  ModrinthUserRole.moderator: 'moderator',
  ModrinthUserRole.developer: 'developer',
};

ModrinthPayoutData _$ModrinthPayoutDataFromJson(Map<String, dynamic> json) =>
    ModrinthPayoutData(
      json['balance'] as String?,
      $enumDecodeNullable(_$ModrinthPayoutWalletEnumMap, json['payout_wallet']),
      $enumDecodeNullable(
          _$ModrinthPayoutWalletTypeEnumMap, json['payout_wallet_type']),
      json['payout_address'] as String?,
    );

Map<String, dynamic> _$ModrinthPayoutDataToJson(ModrinthPayoutData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('balance', instance.balance);
  writeNotNull(
      'payout_wallet', _$ModrinthPayoutWalletEnumMap[instance.payoutWallet]);
  writeNotNull('payout_wallet_type',
      _$ModrinthPayoutWalletTypeEnumMap[instance.payoutWalletType]);
  writeNotNull('payout_address', instance.payoutAddress);
  return val;
}

const _$ModrinthPayoutWalletEnumMap = {
  ModrinthPayoutWallet.paypal: 'paypal',
  ModrinthPayoutWallet.venmo: 'venmo',
};

const _$ModrinthPayoutWalletTypeEnumMap = {
  ModrinthPayoutWalletType.email: 'email',
  ModrinthPayoutWalletType.phone: 'phone',
  ModrinthPayoutWalletType.userHandle: 'userHandle',
};

ModrinthNotification _$ModrinthNotificationFromJson(
        Map<String, dynamic> json) =>
    ModrinthNotification(
      json['id'] as String,
      json['user_id'] as String,
      $enumDecodeNullable(_$ModrinthNotificationTypeEnumMap, json['type']),
      json['title'] as String,
      json['text'] as String,
      json['link'] as String,
      json['read'] as bool,
      json['created'] as String,
      (json['actions'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ModrinthNotificationToJson(
    ModrinthNotification instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'user_id': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$ModrinthNotificationTypeEnumMap[instance.type]);
  val['title'] = instance.title;
  val['text'] = instance.text;
  val['link'] = instance.link;
  val['read'] = instance.read;
  val['created'] = instance.created;
  writeNotNull('actions', instance.actions);
  return val;
}

const _$ModrinthNotificationTypeEnumMap = {
  ModrinthNotificationType.projectUpdate: 'projectUpdate',
  ModrinthNotificationType.teamInvite: 'teamInvite',
  ModrinthNotificationType.statusUpdate: 'statusUpdate',
};

ModrinthPayoutHistory _$ModrinthPayoutHistoryFromJson(
        Map<String, dynamic> json) =>
    ModrinthPayoutHistory(
      json['all_time'] as String?,
      json['last_month'] as String?,
      (json['payouts'] as List<dynamic>?)
          ?.map((e) => ModrinthPayout.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModrinthPayoutHistoryToJson(
    ModrinthPayoutHistory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('all_time', instance.allTime);
  writeNotNull('last_month', instance.lastMonth);
  writeNotNull('payouts', instance.payouts);
  return val;
}

ModrinthPayout _$ModrinthPayoutFromJson(Map<String, dynamic> json) =>
    ModrinthPayout(
      json['created'] as String?,
      json['amount'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$ModrinthPayoutToJson(ModrinthPayout instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created', instance.created);
  writeNotNull('amount', instance.amount);
  writeNotNull('status', instance.status);
  return val;
}

ModrinthTeamMember _$ModrinthTeamMemberFromJson(Map<String, dynamic> json) =>
    ModrinthTeamMember(
      json['team_id'] as String,
      ModrinthUser.fromJson(json['user'] as Map<String, dynamic>),
      json['role'] as String,
      json['permissions'] == null
          ? null
          : ModrinthPermissions.fromJson(json['permissions'] as int),
      json['accepted'] as bool,
      (json['payouts_split'] as num?)?.toDouble(),
      json['ordering'] as int?,
    );

Map<String, dynamic> _$ModrinthTeamMemberToJson(ModrinthTeamMember instance) {
  final val = <String, dynamic>{
    'team_id': instance.teamId,
    'user': instance.user,
    'role': instance.role,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('permissions', ModrinthPermissions.toJson(instance.permissions));
  val['accepted'] = instance.accepted;
  writeNotNull('payouts_split', instance.payoutsSplit);
  writeNotNull('ordering', instance.ordering);
  return val;
}

ModrinthCategory _$ModrinthCategoryFromJson(Map<String, dynamic> json) =>
    ModrinthCategory(
      json['icon'] as String,
      json['name'] as String,
      $enumDecode(_$ModrinthProjectTypeEnumMap, json['project_type']),
      json['header'] as String,
    );

Map<String, dynamic> _$ModrinthCategoryToJson(ModrinthCategory instance) =>
    <String, dynamic>{
      'icon': instance.iconSvg,
      'name': instance.name,
      'project_type': _$ModrinthProjectTypeEnumMap[instance.projectType]!,
      'header': instance.header,
    };

ModrinthLoader _$ModrinthLoaderFromJson(Map<String, dynamic> json) =>
    ModrinthLoader(
      json['icon'] as String,
      json['name'] as String,
      (json['supported_project_types'] as List<dynamic>)
          .map((e) => $enumDecode(_$ModrinthProjectTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ModrinthLoaderToJson(ModrinthLoader instance) =>
    <String, dynamic>{
      'icon': instance.iconSvg,
      'name': instance.name,
      'supported_project_types': instance.supportedProjectTypes
          .map((e) => _$ModrinthProjectTypeEnumMap[e]!)
          .toList(),
    };

ModrinthGameVersion _$ModrinthGameVersionFromJson(Map<String, dynamic> json) =>
    ModrinthGameVersion(
      json['version'] as String,
      $enumDecode(_$ModrinthGameVersionTypeEnumMap, json['version_type']),
      json['date'] as String,
      json['major'] as bool,
    );

Map<String, dynamic> _$ModrinthGameVersionToJson(
        ModrinthGameVersion instance) =>
    <String, dynamic>{
      'version': instance.version,
      'version_type': _$ModrinthGameVersionTypeEnumMap[instance.versionType]!,
      'date': instance.releaseDate,
      'major': instance.major,
    };

const _$ModrinthGameVersionTypeEnumMap = {
  ModrinthGameVersionType.release: 'release',
  ModrinthGameVersionType.snapshot: 'snapshot',
  ModrinthGameVersionType.alpha: 'alpha',
  ModrinthGameVersionType.beta: 'beta',
};

ModrinthLicenseIdentifier _$ModrinthLicenseIdentifierFromJson(
        Map<String, dynamic> json) =>
    ModrinthLicenseIdentifier(
      json['short'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ModrinthLicenseIdentifierToJson(
        ModrinthLicenseIdentifier instance) =>
    <String, dynamic>{
      'short': instance.shortName,
      'name': instance.fullName,
    };

ModrinthDonationPlatform _$ModrinthDonationPlatformFromJson(
        Map<String, dynamic> json) =>
    ModrinthDonationPlatform(
      json['short'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ModrinthDonationPlatformToJson(
        ModrinthDonationPlatform instance) =>
    <String, dynamic>{
      'short': instance.shortName,
      'name': instance.fullName,
    };

LabrinthInstanceStatistics _$LabrinthInstanceStatisticsFromJson(
        Map<String, dynamic> json) =>
    LabrinthInstanceStatistics(
      json['projects'] as int?,
      json['versions'] as int?,
      json['files'] as int?,
      json['authors'] as int?,
    );

Map<String, dynamic> _$LabrinthInstanceStatisticsToJson(
    LabrinthInstanceStatistics instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('projects', instance.projects);
  writeNotNull('versions', instance.versions);
  writeNotNull('files', instance.files);
  writeNotNull('authors', instance.authors);
  return val;
}
