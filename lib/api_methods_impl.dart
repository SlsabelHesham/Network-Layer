import 'package:dio/dio.dart';

import '../constants/keys.dart';
import 'api_config.dart';
import 'api_methods.dart';
import 'constants/responses/base_error_response.dart';
import 'helpers/base_api_result.dart';
import 'helpers/base_error.dart';
import 'helpers/cookies_filter_mixin.dart';
import 'helpers/http_request_type.dart';
import 'models/base_response.dart';

class ApiMethodsImpl with CookiesFilter implements ApiMethods {
  @override
  Future<BaseApiResult<T>> request<T>(String url,
      {
        required HttpRequestType type,
        Map<String, dynamic>? params,
        Map<String, dynamic>? data,
        FormData? formData,
        bool isConcreteMobile = false,
        bool isLanguageAll = false,
        bool hasToken = false,
        bool hasApiKey = false,
        String? sessionKey,
        bool needKey = false,
        T Function(dynamic json)? fromJsonT}) async {
    params ??= <String, dynamic>{};

    /// According to Backend integration with multiple services in a certain API [order-list]:
    /// There is a problem in the Backend side in a way they cannot detect the language even if we send it like usual
    /// in the parameters "ar" & "en" so...
    /// and we will send the lang as "ALL" 👉ONLY👈 in that API [order-list]
    /// then we will send the language in the API Query
    if (isLanguageAll) {
      params.addAll({'lang': "all"});
    } else {
      //params.addAll({'lang': Routes.navigatorKey.currentContext!.locale.languageCode});
    }

    try {
      Response? response;

      if (isConcreteMobile) {
        params.addAll({
          "is_concrete_mobile_api": '1',
        });
      }

      switch (type) {
        case HttpRequestType.post:
          response = await ApiConfig.dio.post(url,
              queryParameters: params,
              data: formData ?? data,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey, needKey: needKey, sessionKey: sessionKey));
          break;
        case HttpRequestType.patch:
          response = await ApiConfig.dio.patch(url,
              queryParameters: params,
              data: formData ?? data,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey, needKey: needKey, sessionKey: sessionKey));
          break;
        case HttpRequestType.delete:
          response = await ApiConfig.dio.delete(url,
              data: formData ?? data,
              queryParameters: params,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey, needKey: needKey, sessionKey: sessionKey));
          break;
        case HttpRequestType.put:
          response = await ApiConfig.dio.put(url,
              data: formData ?? data,
              queryParameters: params,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey, needKey: needKey, sessionKey: sessionKey));
          break;
        case HttpRequestType.get:
          response = await ApiConfig.dio.get(url,
              queryParameters: params,
              options: getOptions(hasToken: hasToken, hasApiKey: hasApiKey, needKey: needKey, sessionKey: sessionKey));
          break;
      }
      return handleResponse<T>(response, fromJsonT: fromJsonT);
    } on DioException catch (error) {
      return catchError<T>(error);
    }
  }

  @override
  Options getOptions({bool hasToken = true, bool hasApiKey = true, bool needKey = false, String? sessionKey}) {
    Map<String, dynamic> extras = {};
    extras[Keys.authorizationRequired] = hasToken;
    extras[Keys.apiKeyRequired] = hasApiKey;
    extras[Keys.consumerKeyRequired] = needKey;
    var options = Options(
      extra: extras,
      headers: {
        if (hasToken) Keys.authorization: 'token',
        if (sessionKey != null && sessionKey.isNotEmpty) "cookie": sessionKey
      },
    );
    return options;
  }

  @override
  BaseApiResult<T> handleResponse<T>(
      Response response, {
        T Function(dynamic json)? fromJsonT,
      }) {
    final responseData = response.data;
    if (responseData == null) {
      return BaseApiResult<T>(
        status: response.statusCode,
        data: response.data,
        error: BaseApiError(
          errorType: DioExceptionType.unknown,
          responseStatusCode: response.statusCode,
        ),
      );
    }

    try {
      String sessionKey = getSessionKeyHeader(response.headers.map);
      final baseResponse = BaseResponse<T>.fromJson(
        responseData,
        fromJsonT: fromJsonT,
      );

      return BaseApiResult<T>(
        data: baseResponse.data,
        status: response.statusCode,
        successMessage: baseResponse.successMessage,
        sessionKey: sessionKey,
      );
    } catch (e) {
      return BaseApiResult<T>(
        status: response.statusCode,
        error: BaseApiError(
          errorMessage: 'Parsing error: $e',
          errorType: DioExceptionType.unknown,
          responseStatusCode: response.statusCode,
        ),
      );
    }
  }


  @override
  BaseApiResult<E> catchError<E>(DioException dioError) {
    if (dioError.type == DioExceptionType.badResponse) {
      return handleApiErrors(dioError);
    } else {
      return handleDioErrors(dioError);
    }
  }

  @override
  BaseApiResult<E> handleDioErrors<E>(DioException dioError) {
    return BaseApiResult(
        error: BaseApiError(
            responseStatusCode: dioError.response?.statusCode,
            errorType: dioError.type,
            errorMessage: dioError.response?.statusMessage ?? "LocaleKeys.generalError.tr()"));
  }

  @override
  BaseApiResult<E> handleApiErrors<E>(DioException dioError) {
    final responseData = dioError.response?.data;

    if (responseData == null || responseData.toString().trim().isEmpty) {
      return BaseApiResult<E>(
        error: BaseApiError(
          responseStatusCode: dioError.response?.statusCode,
          errorType: DioExceptionType.unknown,
          errorMessage: dioError.response?.statusMessage ?? "Something went wrong",
        ),
      );
    }

    if (responseData is Map<String, dynamic>) {
      try {
        final baseResponse = BaseErrorResponse.fromJson(responseData);
        return BaseApiResult<E>(
          error: BaseApiError(
            responseStatusCode: dioError.response?.statusCode,
            errorType: dioError.type,
            errorCode: baseResponse.code,
            errorMessage: baseResponse.error,
            baseFormErrors: baseResponse.data?.errors,
          ),
        );
      } catch (e) {
        return BaseApiResult<E>(
          error: BaseApiError(
            responseStatusCode: dioError.response?.statusCode,
            errorType: dioError.type,
            errorMessage: dioError.response?.statusMessage ?? "Something went wrong",
          ),
        );
      }
    }

    return BaseApiResult<E>(
      error: BaseApiError(
        responseStatusCode: dioError.response?.statusCode,
        errorType: DioExceptionType.unknown,
        errorMessage: dioError.response?.statusMessage ?? "Something went wrong",
      ),
    );
  }

}
