import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/utils/enum.dart';

final mediaTypeSelectionScreenViewModelProvider =
    ChangeNotifierProvider.autoDispose<MediaTypeSelectionScreenViewModel>(
        (ref) {
  return MediaTypeSelectionScreenViewModel();
});

class MediaTypeSelectionScreenViewModel extends ChangeNotifier {
  List<MediaTypes> mediaTypes = [];

  void selectMediaType(MediaTypes types) {
    if (mediaTypes.contains(types)) {
      mediaTypes.remove(types);
    } else {
      mediaTypes.add(types);
    }
    notifyListeners();
  }

  void addAllMediaType(List<MediaTypes> types) {
    mediaTypes.addAll(types);
  }
}

class MediaSelectionScreenArgs {
  List<MediaTypes> mediaTypes = [];
  MediaSelectionScreenArgs({required this.mediaTypes});
}
