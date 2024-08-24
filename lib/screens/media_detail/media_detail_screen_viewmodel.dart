// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:ituneclone/repository/itune_repository.dart';
import 'package:ituneclone/utils/string_resource.dart';
import 'package:video_player/video_player.dart';

final mediaDetailProvider = ChangeNotifierProvider.autoDispose(
    (ref) => MediaDetailScreenViewModel(ref.read(repositoryProvider)));

class MediaDetailScreenViewModel extends ChangeNotifier {
  final ItuneRepository _repository;
  MediaDetailScreenViewModel(this._repository);
  SearchResult? searchResult;
  bool isLoading = false;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  StreamController errorStreamController = StreamController();

  Future<void> init(MediaDetailScreenArgs screenArgs,
      {bool refreshLoading = false}) async {
    try {
      isLoading = true;
      if (refreshLoading) {
        notifyListeners();
      }
      final response = await _repository.getMediaDetail(screenArgs.id);
      if (response.data != null) {
        searchResult = response.data?.firstOrNull;
      } else {
        errorStreamController.add(StringResource.somethingWentWrong);
      }
    } catch (e) {
      errorStreamController.add(StringResource.somethingWentWrong);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> initializePlayer() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(searchResult!.previewUrl!));
    await videoPlayerController?.initialize();
    if (videoPlayerController != null) {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
      );
    }
    notifyListeners();
  }

  @override
  void dispose() {
    chewieController?.dispose();
    videoPlayerController?.dispose();
    errorStreamController.close();
    super.dispose();
  }
}

class MediaDetailScreenArgs {
  final int id;
  MediaDetailScreenArgs({
    required this.id,
  });
}
