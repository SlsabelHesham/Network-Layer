import 'package:dio/dio.dart';

import '../helpers/base_api_result.dart';

mixin AppRequestHandler {
  BaseApiResult<T> handleResponse<T>(Response response);
  BaseApiResult<E> catchError<E>(DioException dioError);
  BaseApiResult<E> handleDioErrors<E>(DioException dioError);
  BaseApiResult<E> handleApiErrors<E>(DioException dioError);
}
