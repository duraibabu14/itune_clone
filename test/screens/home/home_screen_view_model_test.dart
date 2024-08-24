import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/entity/request/search_request.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:ituneclone/repository/itune_repository.dart';
import 'package:ituneclone/screens/home/home_screen_viewmodel.dart';
import 'package:ituneclone/utils/base_response.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:mocktail/mocktail.dart';

class MockItuneRepository extends Mock implements ItuneRepository {}

void main() {
  late HomeScreenViewModel homeScreenViewModel;
  late MockItuneRepository mockRepository;

  setUp(() {
    mockRepository = MockItuneRepository();
    homeScreenViewModel = HomeScreenViewModel(mockRepository);
  });

  final successResponse = BaseResponse(data: [
    SearchResult(
        artistName: "Testing",
        primaryGenreName: "Comedy",
        trackName: "Test Movie")
  ]);

  final failureResponse = BaseResponse<List<SearchResult>>(
    data: null,
    error: "Something Went Wrong",
  );
  group("HomeScreenViewModel Get All Itune", () {
    test("Search Result Success Response", () async {
      when(() => mockRepository.getSearchResults(SearchRequest(term: "jo")))
          .thenAnswer((_) async {
        return successResponse;
      });
      await homeScreenViewModel.init(
          HomeScreenArgs(mediaTypes: [MediaTypes.movie], searchText: "jo"));
      expect(homeScreenViewModel.searchResult, isNotEmpty);
    });

    test("Search Result Failure Response", () async {
      when(() => mockRepository.getSearchResults(SearchRequest(term: "jo")))
          .thenAnswer((_) async => failureResponse);
      await homeScreenViewModel.init(
          HomeScreenArgs(mediaTypes: [MediaTypes.movie], searchText: "jo"));
      expect(homeScreenViewModel.searchResult, isEmpty);
    });
  });
}
