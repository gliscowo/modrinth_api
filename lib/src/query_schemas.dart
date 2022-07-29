import 'package:json_annotation/json_annotation.dart';

import 'modrinth_api_base.dart';
import 'type_models.dart';

part 'query_schemas.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ModrinthSearchQueryResponse {
  final List<ModrinthSearchResult> hits;
  final int offset;
  final int limit;
  final int totalHits;

  ModrinthSearchQueryResponse(this.hits, this.offset, this.limit, this.totalHits);

  factory ModrinthSearchQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$ModrinthSearchQueryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ModrinthSearchQueryResponseToJson(this);

  @override
  String toString() => encoder.convert(toJson());
}
