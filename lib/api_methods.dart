import 'package:dio/dio.dart';

import 'handlers/request_handler.dart';
import 'helpers/base_api_result.dart';
import 'helpers/http_request_type.dart';

abstract class ApiMethods with AppRequestHandler {
  Future<BaseApiResult<T>> request<T>(
    String url, {
    required HttpRequestType type,
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
    FormData? formData,
    bool isLanguageAll = false,
    bool hasToken = false,
    bool isConcreteMobile = false,
    bool hasApiKey = false,
    bool needKey = false,
    String? sessionKey,
        T Function(dynamic json)? fromJsonT
  });

  Options getOptions({bool hasToken = true});

  @override
  BaseApiResult<T> handleResponse<T>(Response response);

  @override
  BaseApiResult<E> catchError<E>(DioException dioError);

  @override
  BaseApiResult<E> handleDioErrors<E>(DioException dioError);

  @override
  BaseApiResult<E> handleApiErrors<E>(DioException dioError);
}
