import 'package:ituneclone/entity/base_equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "search_request.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchRequest extends BaseEquatable {
  final String term;
  final List<String>? media;
  SearchRequest({
    required this.term,
    this.media,
  });

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}
