// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:ituneclone/network/api_service.dart';
import 'package:ituneclone/utils/app_utils.dart';
import 'package:ituneclone/utils/string_resource.dart';
import 'package:video_player/video_player.dart';

final mediaDetailProvider =
    ChangeNotifierProvider.autoDispose((ref) => MediaDetailScreenViewModel());

class MediaDetailScreenViewModel extends ChangeNotifier {
  SearchResult? searchResult;
  bool isLoading = false;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  final _apiService = ApiService();

  Future<void> init(MediaDetailScreenArgs screenArgs) async {
    try {
      isLoading = true;
      final response = await _apiService.getMediaDetail(id: screenArgs.id);
      if (response.response.statusCode == 200 &&
          response.data.results.isNotEmpty) {
        searchResult = response.data.results.firstOrNull;
        isLoading = false;
        notifyListeners();
      } else {
        AppUtils.instance().showToast(StringResource.somethingWentWrong);
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      AppUtils.instance().showToast(StringResource.somethingWentWrong);
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
    super.dispose();
  }
}

class MediaDetailScreenArgs {
  final int id;
  MediaDetailScreenArgs({
    required this.id,
  });
}
