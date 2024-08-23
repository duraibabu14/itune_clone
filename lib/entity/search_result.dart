// ignore_for_file: must_be_immutable

import 'package:ituneclone/entity/base_equatable.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult extends BaseEquatable {
  final String? wrapperType;
  @JsonKey(unknownEnumValue: null)
  final ResultKind? kind;
  final int? artistId;
  final int? trackId;
  final String? artistName;
  final String? trackName;
  final String? trackCensoredName;
  final String? artistViewUrl;
  final String? trackViewUrl;
  final String? previewUrl;
  final String? artworkUrl30;
  final String? artworkUrl60;
  final String? artworkUrl100;
  final double? collectionPrice;
  final double? trackPrice;
  final String? releaseDate;
  final String? collectionExplicitness;
  final String? trackExplicitness;
  final int? trackTimeMillis;
  final String? country;
  final String? currency;
  final String? primaryGenreName;
  final String? collectionName;
  final String? shortDescription;
  String? longDescription;
  final String? contentAdvisoryRating;
  final String? collectionViewUrl;
  final String? description;
  SearchResult(
      {this.wrapperType,
      this.kind,
      this.artistId,
      this.trackId,
      this.artistName,
      this.trackName,
      this.trackCensoredName,
      this.artistViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.collectionName,
      this.longDescription,
      this.contentAdvisoryRating,
      this.shortDescription,
      this.collectionViewUrl,
      this.description}) {
    longDescription ??= description;
  }

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
