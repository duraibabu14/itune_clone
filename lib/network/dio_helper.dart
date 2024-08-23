import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:ituneclone/network/network_properties.dart';
import 'package:ituneclone/utils/app_utils.dart';
import 'package:ituneclone/utils/ssl_cer.dart';

class DioHelper {
  Dio dio = Dio();

  DioHelper() {
    dio.options.baseUrl = NetworkProperties.BASE_URL;
    dio.options.followRedirects = true;
    dio.options.headers[HttpHeaders.acceptHeader] = "application/json";
    dio.options.validateStatus = (status) => status! <= 400;
    dio.options.responseType = ResponseType.json;
    dio.transformer = BackgroundTransformer();
    final bytes = SSLCer.getCert();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final SecurityContext context = SecurityContext(withTrustedRoots: false);
      context.setTrustedCertificatesBytes(bytes!);

      HttpClient httpClient = HttpClient(context: context);
      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return cert.pem == String.fromCharCodes(bytes);
      };
      return httpClient;
    };
    _setupAuthInterceptor();
    _setupLogInterceptor();
  }

  void _setupAuthInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          handler.next(options);
        },
        onResponse: (response, handler) {
          response.data = jsonDecode(response.data as String);

          handler.next(response);
        },
        onError: (
          DioException error,
          ErrorInterceptorHandler errorInterceptorHandler,
        ) async {
          errorInterceptorHandler.resolve(
            Response(
              requestOptions: error.requestOptions,
              data: {"error": error.message},
              statusCode: error.response?.statusCode,
            ),
          );
        },
      ),
    );
  }

  void _setupLogInterceptor() {
    if (ENVMode.isInDevMode) {
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
    }
  }
}

final Dio dio = DioHelper().dio;
