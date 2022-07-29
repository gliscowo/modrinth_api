// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_schemas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModrinthSearchQueryResponse _$ModrinthSearchQueryResponseFromJson(
        Map<String, dynamic> json) =>
    ModrinthSearchQueryResponse(
      (json['hits'] as List<dynamic>)
          .map((e) => ModrinthSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['limit'] as int,
      json['total_hits'] as int,
    );

Map<String, dynamic> _$ModrinthSearchQueryResponseToJson(
        ModrinthSearchQueryResponse instance) =>
    <String, dynamic>{
      'hits': instance.hits,
      'offset': instance.offset,
      'limit': instance.limit,
      'total_hits': instance.totalHits,
    };
