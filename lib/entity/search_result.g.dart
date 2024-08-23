// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      wrapperType: json['wrapperType'] as String?,
      kind: $enumDecodeNullable(_$ResultKindEnumMap, json['kind']),
      artistId: (json['artistId'] as num?)?.toInt(),
      trackId: (json['trackId'] as num?)?.toInt(),
      artistName: json['artistName'] as String?,
      trackName: json['trackName'] as String?,
      trackCensoredName: json['trackCensoredName'] as String?,
      artistViewUrl: json['artistViewUrl'] as String?,
      trackViewUrl: json['trackViewUrl'] as String?,
      previewUrl: json['previewUrl'] as String?,
      artworkUrl30: json['artworkUrl30'] as String?,
      artworkUrl60: json['artworkUrl60'] as String?,
      artworkUrl100: json['artworkUrl100'] as String?,
      collectionPrice: (json['collectionPrice'] as num?)?.toDouble(),
      trackPrice: (json['trackPrice'] as num?)?.toDouble(),
      releaseDate: json['releaseDate'] as String?,
      collectionExplicitness: json['collectionExplicitness'] as String?,
      trackExplicitness: json['trackExplicitness'] as String?,
      trackTimeMillis: (json['trackTimeMillis'] as num?)?.toInt(),
      country: json['country'] as String?,
      currency: json['currency'] as String?,
      primaryGenreName: json['primaryGenreName'] as String?,
      collectionName: json['collectionName'] as String?,
      longDescription: json['longDescription'] as String?,
      contentAdvisoryRating: json['contentAdvisoryRating'] as String?,
      shortDescription: json['shortDescription'] as String?,
      collectionViewUrl: json['collectionViewUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'wrapperType': instance.wrapperType,
      'kind': _$ResultKindEnumMap[instance.kind],
      'artistId': instance.artistId,
      'trackId': instance.trackId,
      'artistName': instance.artistName,
      'trackName': instance.trackName,
      'trackCensoredName': instance.trackCensoredName,
      'artistViewUrl': instance.artistViewUrl,
      'trackViewUrl': instance.trackViewUrl,
      'previewUrl': instance.previewUrl,
      'artworkUrl30': instance.artworkUrl30,
      'artworkUrl60': instance.artworkUrl60,
      'artworkUrl100': instance.artworkUrl100,
      'collectionPrice': instance.collectionPrice,
      'trackPrice': instance.trackPrice,
      'releaseDate': instance.releaseDate,
      'collectionExplicitness': instance.collectionExplicitness,
      'trackExplicitness': instance.trackExplicitness,
      'trackTimeMillis': instance.trackTimeMillis,
      'country': instance.country,
      'currency': instance.currency,
      'primaryGenreName': instance.primaryGenreName,
      'collectionName': instance.collectionName,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'contentAdvisoryRating': instance.contentAdvisoryRating,
      'collectionViewUrl': instance.collectionViewUrl,
      'description': instance.description,
    };

const _$ResultKindEnumMap = {
  ResultKind.book: 'book',
  ResultKind.album: 'album',
  ResultKind.coachedAudio: 'coached-audio',
  ResultKind.featureMovie: 'feature-movie',
  ResultKind.interactiveBooklet: 'interactive-booklet',
  ResultKind.musicVideo: 'music-video',
  ResultKind.pdf: 'pdf',
  ResultKind.podcast: 'podcast',
  ResultKind.podcastEpisode: 'podcast-episode',
  ResultKind.softwarePackage: 'software',
  ResultKind.song: 'song',
  ResultKind.tvEpisode: 'tv-episode',
  ResultKind.artist: 'artist',
  ResultKind.ebook: 'ebook',
};
