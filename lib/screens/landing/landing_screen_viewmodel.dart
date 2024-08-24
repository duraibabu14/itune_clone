import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/utils/app_utils.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:ituneclone/utils/string_resource.dart';

final landingScreenViewModelProvider =
    ChangeNotifierProvider.autoDispose<LandingScreenViewModel>((ref) {
  return LandingScreenViewModel();
});

class LandingScreenViewModel extends ChangeNotifier {
  List<MediaTypes> mediaTypes = [];
  final searchController = TextEditingController();

  void addAllMediaTypes(List<MediaTypes> types) {
    mediaTypes = types;
    notifyListeners();
  }

  bool isSearchTextValidated() {
    final searchText = searchController.text.trim();
    if (searchText.isEmpty) {
      AppUtils.instance().showToast(StringResource.searchCannotBeEmpty);
    }
    return searchText.isNotEmpty;
  }

  Future<bool> isRooted() async {
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
