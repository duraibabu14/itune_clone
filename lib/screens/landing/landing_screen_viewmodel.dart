import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/utils/app_utils.dart';
import 'package:ituneclone/utils/enum.dart';

final landingScreenViewModelProvider =
    ChangeNotifierProvider.autoDispose<LandingScreenViewModel>((ref) {
  return LandingScreenViewModel();
});

class LandingScreenViewModel extends ChangeNotifier {
  List<MediaTypes> mediaTypes = [];
  final searchController = TextEditingController();

  void addAllMediaTypes(List<MediaTypes> types) {
    mediaTypes.clear();
    mediaTypes.addAll(types);
    notifyListeners();
  }

  bool isSearchTextValidated() {
    if (searchController.text.trim().isEmpty) {
      // AppUtils.instance().showToast(StringResource.searchCannotBeEmpty);
      return false;
    } else {
      return searchController.text.trim().isNotEmpty;
    }
  }

  Future<bool> isBreaked() async {
    if (ENVMode.isInDevMode) {
      return false;
    }
    return await FlutterJailbreakDetection.jailbroken;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
