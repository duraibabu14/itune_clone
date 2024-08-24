import 'package:ituneclone/entity/base_equatable.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:json_annotation/json_annotation.dart';

part "search_result_response_entity.g.dart";

@JsonSerializable()
class SearchResultResponseEntity extends BaseEquatable {
  final int resultCount;
  final List<SearchResult> results;
  SearchResultResponseEntity({
    required this.resultCount,
    required this.results,
  });

  factory SearchResultResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchResultResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultResponseEntityToJson(this);
}
