import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/entity/request/search_request.dart';
import 'package:ituneclone/entity/search_result.dart';
import 'package:ituneclone/network/api_service.dart';
import 'package:ituneclone/utils/base_response.dart';

class ItuneRepository {
  final ApiService apiService;
  const ItuneRepository(this.apiService);
  Future<BaseResponse<List<SearchResult>>> getSearchResults(
      SearchRequest request) async {
    try {
      final response = await apiService.searchItuneStore(request: request);
      return BaseResponse(data: response.data.results);
    } catch (e) {
      return BaseResponse(error: e.toString());
    }
  }

  Future<BaseResponse<List<SearchResult>>> getMediaDetail(int id) async {
    try {
      final response = await apiService.getMediaDetail(id: id);
      return BaseResponse(data: response.data.results);
    } catch (e) {
      return BaseResponse(error: e.toString());
    }
  }
}

final repositoryProvider =
    Provider((ref) => ItuneRepository(ref.read(apiServiceProvider)));
