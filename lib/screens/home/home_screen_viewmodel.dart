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
  return HomeScreenViewModel(ref.read(apiServiceProvider));
});

class HomeScreenViewModel extends ChangeNotifier {
  final ApiService _apiService;
  HomeScreenViewModel(this._apiService);

  late TabController tabController;

  final List<SearchResultModel> searchResult = [];

  bool isLoading = false;
  Future<void> init(HomeScreenArgs screenArgs) async {
    try {
      isLoading = true;

      final medias = screenArgs.mediaTypes.length == MediaTypes.values.length
          ? ["all"]
          : screenArgs.mediaTypes.map((e) => e.name).toList();

      final response = await _apiService.searchItuneStore(
        request: SearchRequest(term: screenArgs.searchText, media: medias),
      );

      if (response.response.statusCode == 200 &&
          response.data.results.isNotEmpty) {
        for (final data in ResultKind.values) {
          final results = response.data.results
              .where((element) => element.kind == data)
              .toList();
          searchResult.add(
            SearchResultModel(kind: data, result: results),
          );
        }
      } else {
        AppUtils.instance().showToast(StringResource.somethingWentWrong);
      }
    } catch (e) {
      AppUtils.instance().showToast(StringResource.somethingWentWrong);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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

class SearchResultModel {
  final ResultKind kind;
  final List<SearchResult> result;
  SearchResultModel({
    required this.kind,
    required this.result,
  });
}
