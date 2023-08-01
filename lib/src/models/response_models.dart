import 'package:json_annotation/json_annotation.dart';

import '../modrinth_api_base.dart';

part 'response_models.g.dart';

enum ModrinthSideSupport {
  required,
  optional,
  unsupported,
}

// --- projects ---

@JsonSerializable()
class ModrinthProject {
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
  final ModrinthProjectType projectType;
  final int downloads;
  final String? iconUrl;
  final int? color;
  final String id;
  final String team;
  final ModrinthModeratorMessage? moderatorMessage;
  final String published;
  final String updated;
  final String? approved;
  final int followers;
  final ModrinthProjectStatus status;
  final ModrinthLicense? license;
  final List<String>? versions;
  final List<String>? gameVersions;
  final List<String>? loaders;
  final List<ModrinthGalleryEntry>? gallery;

  ModrinthProject(
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
    this.projectType,
    this.downloads,
    this.iconUrl,
    this.color,
    this.id,
    this.team,
    this.moderatorMessage,
    this.published,
    this.updated,
    this.approved,
    this.followers,
    this.status,
    this.license,
    this.versions,
    this.gameVersions,
    this.loaders,
    this.gallery,
  );

  factory ModrinthProject.fromJson(Map<String, dynamic> json) => _$ModrinthProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthProjectToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthDonationUrl {
  final String? id;
  final String? platform;
  final String? url;

  ModrinthDonationUrl({
    this.id,
    this.platform,
    this.url,
  });

  factory ModrinthDonationUrl.fromJson(Map<String, dynamic> json) => _$ModrinthDonationUrlFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthDonationUrlToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthGalleryEntry {
  final String url;
  final bool featured;
  final String? title;
  final String? description;
  final String created;
  final int? ordering;

  ModrinthGalleryEntry(
    this.url,
    this.featured,
    this.title,
    this.description,
    this.created,
    this.ordering,
  );

  factory ModrinthGalleryEntry.fromJson(Map<String, dynamic> json) => _$ModrinthGalleryEntryFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthGalleryEntryToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthLicense {
  final String? id;
  final String? name;
  final String? url;

  ModrinthLicense(
    this.id,
    this.name,
    this.url,
  );

  factory ModrinthLicense.fromJson(Map<String, dynamic> json) => _$ModrinthLicenseFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthLicenseToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthModeratorMessage {
  final String message;
  final String? body;

  ModrinthModeratorMessage(
    this.message,
    this.body,
  );

  factory ModrinthModeratorMessage.fromJson(Map<String, dynamic> json) => _$ModrinthModeratorMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthModeratorMessageToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthProjectStatus {
  approved,
  rejected,
  draft,
  unlisted,
  archived,
  processing,
  unknown,
}

enum ModrinthProjectType {
  mod,
  modpack,
  resourcepack,
  shader,
}

// --- searching ---

@JsonSerializable()
class ModrinthSearchResult {
  final String slug;
  final String title;
  final String description;
  final List<String>? categories;
  final ModrinthSideSupport clientSide;
  final ModrinthSideSupport serverSide;
  final String projectType;
  final int downloads;
  final String? iconUrl;
  final int? color;
  final String projectId;
  final String author;
  final List<String>? displayCategories;
  final List<String> versions;
  final int follows;
  final String dateCreated;
  final String dateModified;
  final String? latestVersion;
  final String license;
  final List<String>? gallery;
  final String? featureGallery;

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
    this.color,
    this.projectId,
    this.author,
    this.displayCategories,
    this.versions,
    this.follows,
    this.dateCreated,
    this.dateModified,
    this.latestVersion,
    this.license,
    this.gallery,
    this.featureGallery,
  );

  factory ModrinthSearchResult.fromJson(Map<String, dynamic> json) => _$ModrinthSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthSearchResultToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthSearchQueryResponse {
  final List<ModrinthSearchResult> hits;
  final int offset;
  final int limit;
  final int totalHits;

  ModrinthSearchQueryResponse(
    this.hits,
    this.offset,
    this.limit,
    this.totalHits,
  );

  factory ModrinthSearchQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$ModrinthSearchQueryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthSearchQueryResponseToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

// --- versions ---

@JsonSerializable()
class ModrinthVersion {
  final String name;
  final String versionNumber;
  final String? changelog;
  final List<ModrinthDependency>? dependencies;
  final List<String> gameVersions;
  final ModrinthVersionType versionType;
  final List<String> loaders;
  final bool featured;
  final ModrinthVersionStatus? status;
  final ModrinthVersionStatus? requestedStatus;
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
    this.status,
    this.requestedStatus,
    this.id,
    this.projectId,
    this.authorId,
    this.datePublished,
    this.downloads,
    this.files,
  );

  factory ModrinthVersion.fromJson(Map<String, dynamic> json) => _$ModrinthVersionFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthVersionToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthVersionType {
  release,
  beta,
  alpha,
}

enum ModrinthVersionStatus {
  listed,
  archived,
  draft,
  unlisted,
  scheduled,
  unknown,
}

@JsonSerializable()
class ModrinthDependency {
  final String? versionId;
  final String? projectId;
  final String? fileName;
  final ModrinthDependencyType dependencyType;

  ModrinthDependency(
    this.versionId,
    this.projectId,
    this.fileName,
    this.dependencyType,
  );

  factory ModrinthDependency.fromJson(Map<String, dynamic> json) => _$ModrinthDependencyFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthDependencyToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthDependencyType {
  required,
  optional,
  incompatible,
  embedded,
}

@JsonSerializable()
class ModrinthFile {
  final Map<String, String> hashes;
  final String url;
  final String filename;
  final bool primary;
  final int size;
  final ModrinthFileType? fileType;

  ModrinthFile(
    this.hashes,
    this.url,
    this.filename,
    this.primary,
    this.size,
    this.fileType,
  );

  factory ModrinthFile.fromJson(Map<String, dynamic> json) => _$ModrinthFileFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthFileToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonEnum(fieldRename: FieldRename.kebab)
enum ModrinthFileType {
  requiredResourcePack,
  optionalResourcePack,
}

// --- users ---

@JsonSerializable()
class ModrinthUser {
  final String username;
  final String? name;
  final String? email;
  final String? bio;
  final ModrinthPayoutData? payoutData;
  final String id;
  final int? githubId;
  final String avatarUrl;
  final String created;
  final ModrinthUserRole role;
  final int? badges;

  ModrinthUser(
    this.username,
    this.name,
    this.email,
    this.bio,
    this.payoutData,
    this.id,
    this.githubId,
    this.avatarUrl,
    this.created,
    this.role,
    this.badges,
  );

  factory ModrinthUser.fromJson(Map<String, dynamic> json) => _$ModrinthUserFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthUserToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthUserRole {
  admin,
  moderator,
  developer,
}

@JsonSerializable()
class ModrinthPayoutData {
  final String? balance;
  final ModrinthPayoutWallet? payoutWallet;
  final ModrinthPayoutWalletType? payoutWalletType;
  final String? payoutAddress;

  ModrinthPayoutData(
    this.balance,
    this.payoutWallet,
    this.payoutWalletType,
    this.payoutAddress,
  );

  factory ModrinthPayoutData.fromJson(Map<String, dynamic> json) => _$ModrinthPayoutDataFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthPayoutDataToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthPayoutWallet {
  paypal,
  venmo,
}

enum ModrinthPayoutWalletType {
  email,
  phone,
  userHandle,
}

@JsonSerializable()
class ModrinthNotification {
  final String id;
  final String userId;
  final ModrinthNotificationType? type;
  final String title;
  final String text;
  final String link;
  final bool read;
  final String created;
  final List<Map<String, dynamic>>? actions;

  ModrinthNotification(
    this.id,
    this.userId,
    this.type,
    this.title,
    this.text,
    this.link,
    this.read,
    this.created,
    this.actions,
  );

  factory ModrinthNotification.fromJson(Map<String, dynamic> json) => _$ModrinthNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthNotificationToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthNotificationType {
  projectUpdate,
  teamInvite,
  statusUpdate,
}

@JsonSerializable()
class ModrinthPayoutHistory {
  final String? allTime;
  final String? lastMonth;
  final List<ModrinthPayout>? payouts;

  ModrinthPayoutHistory(
    this.allTime,
    this.lastMonth,
    this.payouts,
  );

  factory ModrinthPayoutHistory.fromJson(Map<String, dynamic> json) => _$ModrinthPayoutHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthPayoutHistoryToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthPayout {
  final String? created;
  final String? amount;
  final String? status;

  ModrinthPayout(
    this.created,
    this.amount,
    this.status,
  );

  factory ModrinthPayout.fromJson(Map<String, dynamic> json) => _$ModrinthPayoutFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthPayoutToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

// --- team members ---

@JsonSerializable()
class ModrinthTeamMember {
  final String teamId;
  final ModrinthUser user;
  final String role;
  @JsonKey(toJson: ModrinthPermissions.toJson)
  final ModrinthPermissions? permissions;
  final bool accepted;
  final int? payoutsSplit;
  final int? ordering;

  ModrinthTeamMember(
    this.teamId,
    this.user,
    this.role,
    this.permissions,
    this.accepted,
    this.payoutsSplit,
    this.ordering,
  );

  factory ModrinthTeamMember.fromJson(Map<String, dynamic> json) => _$ModrinthTeamMemberFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthTeamMemberToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

class ModrinthPermissions {
  static const none = ModrinthPermissions.fromBitfield(0);

  final int bitfield;
  const ModrinthPermissions.fromBitfield(this.bitfield);

  ModrinthPermissions copyWith({
    bool uploadVersion = false,
    bool deleteVersion = false,
    bool editDetails = false,
    bool editBody = false,
    bool manageInvites = false,
    bool removeMember = false,
    bool editMember = false,
    bool deleteProject = false,
    bool viewAnalytics = false,
    bool viewPayouts = false,
  }) =>
      ModrinthPermissions.fromBitfield(bitfield |
          (uploadVersion ? (1 << 0) : 0) |
          (deleteVersion ? (1 << 1) : 0) |
          (editDetails ? (1 << 2) : 0) |
          (editBody ? (1 << 3) : 0) |
          (manageInvites ? (1 << 4) : 0) |
          (removeMember ? (1 << 5) : 0) |
          (editMember ? (1 << 6) : 0) |
          (deleteProject ? (1 << 7) : 0) |
          (viewAnalytics ? (1 << 8) : 0) |
          (viewPayouts ? (1 << 9) : 0));

  bool get uploadVersion => bitfield & (1 << 0) != 0;
  bool get deleteVersion => bitfield & (1 << 1) != 0;
  bool get editDetails => bitfield & (1 << 2) != 0;
  bool get editBody => bitfield & (1 << 3) != 0;
  bool get manageInvites => bitfield & (1 << 4) != 0;
  bool get removeMember => bitfield & (1 << 5) != 0;
  bool get editMember => bitfield & (1 << 6) != 0;
  bool get deleteProject => bitfield & (1 << 7) != 0;
  bool get viewAnalytics => bitfield & (1 << 8) != 0;
  bool get viewPayouts => bitfield & (1 << 9) != 0;

  factory ModrinthPermissions.fromJson(int json) => ModrinthPermissions.fromBitfield(json);
  static int? toJson(ModrinthPermissions? permissions) => permissions?.bitfield;
}

// --- tags ---

@JsonSerializable()
class ModrinthCategory {
  @JsonKey(name: "icon")
  final String iconSvg;
  final String name;
  final ModrinthProjectType projectType;
  final String header;

  ModrinthCategory(
    this.iconSvg,
    this.name,
    this.projectType,
    this.header,
  );

  factory ModrinthCategory.fromJson(Map<String, dynamic> json) => _$ModrinthCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthCategoryToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthLoader {
  @JsonKey(name: "icon")
  final String iconSvg;
  final String name;
  final List<ModrinthProjectType> supportedProjectTypes;

  ModrinthLoader(
    this.iconSvg,
    this.name,
    this.supportedProjectTypes,
  );

  factory ModrinthLoader.fromJson(Map<String, dynamic> json) => _$ModrinthLoaderFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthLoaderToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthGameVersion {
  final String version;
  final ModrinthGameVersionType versionType;
  @JsonKey(name: "date")
  final String releaseDate;
  final bool major;

  ModrinthGameVersion(
    this.version,
    this.versionType,
    this.releaseDate,
    this.major,
  );

  factory ModrinthGameVersion.fromJson(Map<String, dynamic> json) => _$ModrinthGameVersionFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthGameVersionToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

enum ModrinthGameVersionType { release, snapshot, alpha, beta }

@JsonSerializable()
class ModrinthLicenseIdentifier {
  @JsonKey(name: "short")
  final String shortName;
  @JsonKey(name: "name")
  final String fullName;

  ModrinthLicenseIdentifier(
    this.shortName,
    this.fullName,
  );

  factory ModrinthLicenseIdentifier.fromJson(Map<String, dynamic> json) => _$ModrinthLicenseIdentifierFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthLicenseIdentifierToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

@JsonSerializable()
class ModrinthDonationPlatform {
  @JsonKey(name: "short")
  final String shortName;
  @JsonKey(name: "name")
  final String fullName;

  ModrinthDonationPlatform(
    this.shortName,
    this.fullName,
  );

  factory ModrinthDonationPlatform.fromJson(Map<String, dynamic> json) => _$ModrinthDonationPlatformFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthDonationPlatformToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}

// --- stats --

@JsonSerializable()
class LabrinthInstanceStatistics {
  final int? projects;
  final int? versions;
  final int? files;
  final int? authors;

  LabrinthInstanceStatistics(
    this.projects,
    this.versions,
    this.files,
    this.authors,
  );

  factory LabrinthInstanceStatistics.fromJson(Map<String, dynamic> json) => _$LabrinthInstanceStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$LabrinthInstanceStatisticsToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}
