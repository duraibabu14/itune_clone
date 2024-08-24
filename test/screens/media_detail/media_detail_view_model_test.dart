import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:ituneclone/repository/itune_repository.dart';
import 'package:ituneclone/screens/media_detail/media_detail_screen_viewmodel.dart';
import 'package:ituneclone/utils/base_response.dart';
import 'package:mocktail/mocktail.dart';

class MockItuneRepository extends Mock implements ItuneRepository {}

void main() {
  late MediaDetailScreenViewModel mediaDetailViewModel;
  late MockItuneRepository mockRepository;

  setUp(() {
    mockRepository = MockItuneRepository();
    mediaDetailViewModel = MediaDetailScreenViewModel(mockRepository);
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
  group("MediaDetailViewModel Get Media Detail", () {
    test("Detail Success Response", () async {
      when(() => mockRepository.getMediaDetail(any())).thenAnswer((_) async {
        return successResponse;
      });
      await mediaDetailViewModel.init(MediaDetailScreenArgs(id: 12));
      expect(mediaDetailViewModel.searchResult, isNotNull);
    });

    test("Media Detail Failure Response", () async {
      when(() => mockRepository.getMediaDetail(12))
          .thenAnswer((_) async => failureResponse);
      await mediaDetailViewModel.init(MediaDetailScreenArgs(id: 12));
      expect(mediaDetailViewModel.searchResult, isNull);
    });
  });
}
