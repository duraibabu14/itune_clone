import 'package:ituneclone/utils/string_resource.dart';

class BaseResponse<T> {
  T? data;
  String? error;

  BaseResponse({
    this.data,
    this.error,
  });

  bool get hasData => data != null;

  /// Return true if the error object is present or if the data is null
  /// Else it will return false
  bool get hasError => error != null || !hasData;

  String get errorMessage {
    return error ?? StringResource.somethingWentWrong;
  }
}
