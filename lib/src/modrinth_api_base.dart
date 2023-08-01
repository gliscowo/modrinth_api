import 'dart:convert';

import 'package:http/http.dart';

import 'client.dart';
import 'errors.dart';
import 'models/request_models.dart';
import 'models/response_models.dart';
import 'routes/projects.dart';
import 'routes/search.dart';
import 'routes/tags.dart';
import 'routes/teams.dart';
import 'routes/users.dart';
import 'routes/version_files.dart';
import 'routes/versions.dart';

const encoder = JsonEncoder.withIndent("    ");

typedef JsonObject = Map<String, dynamic>;
typedef JsonArray = List<dynamic>;

class ModrinthApi {
  final ModrinthApiClient _client;

  late final Projects projects;
  late final Versions versions;
  late final VersionFiles versionFiles;
  late final Users users;
  late final Teams teams;
  late final Tags tags;

  /// Create a new API client
  ///
  /// Modrinth requires that you specifiy a [userAgent]
  /// that uniquely identifies your application
  ModrinthApi.createClient(
    String userAgent, {
    String baseUrl = "https://api.modrinth.com/v2/",
    RatelimitHandling ratelimitHandling = RatelimitHandling.error,
    String? token,
  }) : _client = ModrinthApiClient(userAgent, baseUrl, ratelimitHandling, token) {
    projects = Projects(_client);
    versions = Versions(_client);
    versionFiles = VersionFiles(_client);
    users = Users(_client);
    teams = Teams(_client);
    tags = Tags(_client);
  }

  Future<LabrinthInstanceStatistics> fetchStatistics() =>
      _client.get("statistics".uri).expect(const {200}).parse(LabrinthInstanceStatistics.fromJson);

  Future<ModrinthSearchQueryResponse> search({
    String? query,
    FacetAndBlock? facets,
    ModrinthSearchIndexType? index,
    int? offset,
    int? limit,
  }) {
    var reponse = _client.get("search".uri.replace(queryParameters: {
      if (query != null) "query": query,
      if (facets != null) "facets": facets.queryString,
      if (index != null) "index": index.name,
      if (offset != null) "offset": offset.toString(),
      if (limit != null) "limit": limit.toString(),
    }));

    return reponse.errorsOn(const {400}).parse(ModrinthSearchQueryResponse.fromJson);
  }

  /// Closes the HTTP client associated with this API client.
  ///
  /// This **needs** to be called at the end of an application's lifecycle,
  /// otherwise the process will hang and not exit
  void dispose() => _client.close();
}

enum RatelimitHandling {
  /// When the API reports the rate limit as exceeded,
  /// carry on as if nothing happened
  ignore,

  /// Throw a [RatelimitExceededException] if the API
  /// reports the rate limit as exceeded to pass
  /// responsibility to the calling function
  error,

  /// When the API reports the rate limit as exceeded,
  /// wait until the current rate limit window resets
  /// and try again
  wait,
}

extension Errors on Future<Response> {
  Future<Response> errorsOn(Set<int> statusCodes) {
    return then((response) {
      if (statusCodes.contains(response.statusCode)) {
        var exception = jsonDecode(utf8.decode(response.bodyBytes));
        throw ModrinthException(
          response.statusCode,
          exception["error"] as String,
          exception["description"] as String,
        );
      } else {
        return response;
      }
    });
  }

  Future<Response> expect(Set<int> statusCodes) {
    return then((response) {
      if (statusCodes.contains(response.statusCode)) return response;
      if (response.statusCode == 404) throw const NoSuchResourceException();

      throw InvalidApiResponseException(response.statusCode, statusCodes, utf8.decode(response.bodyBytes));
    });
  }

  Future<T> parse<J, T>(T Function(J) parser) {
    return then((response) {
      if (response.statusCode == 404) throw const NoSuchResourceException();
      return parser(jsonDecode(utf8.decode(response.bodyBytes)));
    });
  }

  Future<T?> parseOrNull<J, T>(T Function(J) parser) {
    return then((response) => response.statusCode != 404 ? parser(jsonDecode(utf8.decode(response.bodyBytes))) : null);
  }
}
