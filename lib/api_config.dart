import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/interceptor.dart';

class ApiConfig {
  static late Dio _dio;
  static bool _isInitialized = false;
  static AuthInterceptor? _authInterceptor;

  static Dio get dio {
    if (!_isInitialized) {
      throw Exception("ApiConfig is not initialized. Call ApiConfig.init() first.");
    }
    return _dio;
  }

  static void init({required String baseUrl}) {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3),
      baseUrl: baseUrl,
    ))
      ..interceptors.addAll([
        AppInterceptor(),
        if (kDebugMode)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
      ]);

    _isInitialized = true;
  }

  static void setBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
  }

  static void setAuthInterceptor(AuthInterceptor authInterceptor) {
    if (_authInterceptor != null) {
      _dio.interceptors.remove(_authInterceptor!);
    }

    _authInterceptor = authInterceptor;
    _dio.interceptors.add(_authInterceptor!);
  }

  static void removeAuthInterceptor() {
    if (_authInterceptor != null) {
      _dio.interceptors.remove(_authInterceptor!);
      _authInterceptor = null;
    }
  }
}
