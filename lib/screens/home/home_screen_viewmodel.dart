// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/entity/request/search_request.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:ituneclone/repository/itune_repository.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:ituneclone/utils/string_resource.dart';

final homeScreenViewModelProvider =
    ChangeNotifierProvider<HomeScreenViewModel>((ref) {
  return HomeScreenViewModel(ref.read(repositoryProvider));
});

class HomeScreenViewModel extends ChangeNotifier {
  final ItuneRepository _repository;
  HomeScreenViewModel(this._repository);

  late TabController tabController;
  StreamController errorStreamController = StreamController.broadcast();
  StreamSubscription? errorStreamSubscription;
  final List<SearchResultModel> searchResult = [];

  bool isLoading = false;
  Future<void> init(HomeScreenArgs screenArgs,
      {bool refreshLoading = false}) async {
    try {
      searchResult.clear();
      isLoading = true;
      if (refreshLoading) {
        notifyListeners();
      }

      final medias = screenArgs.mediaTypes.length == MediaTypes.values.length
          ? ["all"]
          : screenArgs.mediaTypes.map((e) => e.name).toList();

      final response = await _repository.getSearchResults(
        SearchRequest(term: screenArgs.searchText, media: medias),
      );

      if (response.data != null) {
        for (final data in ResultKind.values) {
          final results =
              response.data!.where((element) => element.kind == data).toList();
          searchResult.add(
            SearchResultModel(kind: data, result: results),
          );
        }
      } else {
        errorStreamController.sink.add(StringResource.somethingWentWrong);
      }
    } catch (e) {
      errorStreamController.sink.add(StringResource.somethingWentWrong);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    errorStreamController.close();
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
