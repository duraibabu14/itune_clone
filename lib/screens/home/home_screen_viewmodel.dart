// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/entity/request/search_request.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:ituneclone/network/api_service.dart';
import 'package:ituneclone/utils/app_utils.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:ituneclone/utils/string_resource.dart';

final homeScreenViewModelProvider =
    ChangeNotifierProvider.autoDispose<HomeScreenViewModel>((ref) {
  return HomeScreenViewModel();
});

class HomeScreenViewModel extends ChangeNotifier {
  late TabController tabController;

  final List<SearchResuleModel> searchResult = [];

  bool isLoading = false;
  final _apiService = ApiService();
  Future<void> init(HomeScreenArgs screenArgs) async {
    try {
      isLoading = true;
      final response = await _apiService.searchItuneStore(
          request: SearchRequest(
              term: screenArgs.searchText,
              media: screenArgs.mediaTypes.length == MediaTypes.values.length
                  ? ["all"]
                  : screenArgs.mediaTypes.map((e) => e.name).toList()));
      if (response.response.statusCode == 200 &&
          response.data.results.isNotEmpty) {
        for (final data in ResultKind.values) {
          searchResult.add(SearchResuleModel(
              kind: data,
              result: response.data.results
                  .where((element) => element.kind == data)
                  .toList()));
        }
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
}

class HomeScreenArgs {
  final String searchText;
  final List<MediaTypes> mediaTypes;
  HomeScreenArgs({
    required this.searchText,
    required this.mediaTypes,
  });
}

class SearchResuleModel {
  final ResultKind kind;
  final List<SearchResult> result;
  SearchResuleModel({
    required this.kind,
    required this.result,
  });
}
