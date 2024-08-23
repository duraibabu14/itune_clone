// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultResponseEntity _$SearchResultResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SearchResultResponseEntity(
      resultCount: (json['resultCount'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResultResponseEntityToJson(
        SearchResultResponseEntity instance) =>
    <String, dynamic>{
      'resultCount': instance.resultCount,
      'results': instance.results,
    };
