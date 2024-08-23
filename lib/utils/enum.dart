import 'package:json_annotation/json_annotation.dart';

enum MediaTypes {
  movie("Movies"),
  podcast("Podcast"),
  music("Music"),
  musicVideo("Music Video"),
  shortFilm("Short Film"),
  tvShow("Tv Shows"),
  software("Software"),
  ebook("Ebook");

  final String title;
  const MediaTypes(this.title);
}

enum ResultKind {
  @JsonValue("book")
  book("Books"),
  @JsonValue("album")
  album("Albums"),
  @JsonValue("coached-audio")
  coachedAudio("Coache Audio"),
  @JsonValue("feature-movie")
  featureMovie("Movies"),
  @JsonValue("interactive-booklet")
  interactiveBooklet("Booklet"),
  @JsonValue("music-video")
  musicVideo("Music Video"),
  @JsonValue("pdf")
  pdf("PDFs"),
  @JsonValue("podcast")
  podcast("Podcast"),
  @JsonValue("podcast-episode")
  podcastEpisode("Podcast"),
  @JsonValue("software")
  softwarePackage("Software"),
  @JsonValue("song")
  song("Song"),
  @JsonValue("tv-episode")
  tvEpisode("Tv Episode"),
  artist("Artist"),
  @JsonValue("ebook")
  ebook("Ebook");

  final String title;
  const ResultKind(this.title);
}

enum LayoutType { grid, list }
