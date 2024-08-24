import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/entity/request/search_request.dart';
import 'package:ituneclone/entity/search_result_response_entity.dart';
import 'package:ituneclone/network/dio_helper.dart';
import 'package:ituneclone/network/http_url.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({String? baseUrl}) {
    return _ApiService(DioHelper().dio, baseUrl: baseUrl);
  }

  @GET(HttpUrls.search)
  Future<HttpResponse<SearchResultResponseEntity>> searchItuneStore(
      {@Queries() required SearchRequest request});

  @GET(HttpUrls.lookUp)
  Future<HttpResponse<SearchResultResponseEntity>> getMediaDetail(
      {@Query("id") required int id});
}

final apiServiceProvider = Provider((ref) => ApiService());
