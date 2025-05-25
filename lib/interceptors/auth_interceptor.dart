import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class TokenStorage {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> setAccessToken(String token);
  Future<void> setRefreshToken(String token);
  Future<void> clearTokens();
}

typedef OnTokenRefreshed = void Function(String accessToken, String refreshToken);
typedef OnRefreshFailed = void Function();

class AuthInterceptor extends InterceptorsWrapper {
  final TokenStorage tokenStorage;
  final String refreshTokenEndpoint;
  final OnTokenRefreshed? onTokenRefreshed;
  final OnRefreshFailed? onRefreshFailed;
  final int unauthorizedStatusCode;
  final Map<String, String>? customHeaders;

  late final Dio _dio;
  bool _isRefreshing = false;
  final _requestsNeedRetry = <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  AuthInterceptor({
    required this.tokenStorage,
    required this.refreshTokenEndpoint,
    this.onTokenRefreshed,
    this.onRefreshFailed,
    this.unauthorizedStatusCode = 401,
    this.customHeaders,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await tokenStorage.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    if (customHeaders != null) {
      options.headers.addAll(customHeaders!);
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    _dio = Dio(BaseOptions(
      baseUrl: _extractBaseUrl(err.requestOptions.baseUrl),
      headers: err.requestOptions.headers,
      queryParameters: err.requestOptions.queryParameters,
    ));

    final response = err.response;

    if (response != null &&
        response.statusCode == unauthorizedStatusCode &&
        !_isRefreshEndpoint(response.requestOptions.path)) {

      if (!_isRefreshing) {
        _isRefreshing = true;
        _requestsNeedRetry.add((options: response.requestOptions, handler: handler));

        final isRefreshSuccess = await _refreshToken();

        if (isRefreshSuccess) {
          await _retryFailedRequests();
        } else {
          _clearRequestsAndHandleFailure();
        }
      } else {
        _requestsNeedRetry.add((options: response.requestOptions, handler: handler));
      }
    } else {
      return handler.next(err);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await tokenStorage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        if (kDebugMode) {
          print("No refresh token available");
        }
        return false;
      }

      final response = await _callRefreshTokenApi(refreshToken);

      if (response.statusCode == 200) {
        final data = response.data;
        final newAccessToken = _extractTokenFromResponse(data, 'access_token');
        final newRefreshToken = _extractTokenFromResponse(data, 'refresh_token');

        if (newAccessToken != null) {
          await tokenStorage.setAccessToken(newAccessToken);
          if (newRefreshToken != null) {
            await tokenStorage.setRefreshToken(newRefreshToken);
          }

          onTokenRefreshed?.call(newAccessToken, newRefreshToken ?? refreshToken);
          return true;
        }
      }

      if (kDebugMode) {
        print("Refresh token failed: ${response.statusMessage ?? response.toString()}");
      }
      return false;
    } catch (error) {
      if (kDebugMode) {
        print("Refresh token error: $error");
      }
      return false;
    }
  }

  Future<Response> _callRefreshTokenApi(String refreshToken) {
    return _dio.post(
      refreshTokenEndpoint,
      data: FormData.fromMap({
        "refresh_token": refreshToken,
      }),
    );
  }

  Future<void> _retryFailedRequests() async {
    for (var requestNeedRetry in _requestsNeedRetry) {
      _dio.fetch(requestNeedRetry.options).then((response) {
        requestNeedRetry.handler.resolve(response);
      }).catchError((error) {
        requestNeedRetry.handler.reject(error);
      });
    }

    _requestsNeedRetry.clear();
    _isRefreshing = false;
  }

  void _clearRequestsAndHandleFailure() {
    _requestsNeedRetry.clear();
    _isRefreshing = false;

    tokenStorage.clearTokens();

    onRefreshFailed?.call();
  }

  String _extractBaseUrl(String baseUrl) {
    if (baseUrl.endsWith('/')) {
      return baseUrl.substring(0, baseUrl.length - 1);
    }
    return baseUrl;
  }

  bool _isRefreshEndpoint(String path) {
    return path.contains(refreshTokenEndpoint);
  }

  String? _extractTokenFromResponse(dynamic data, String tokenKey) {
    try {
      if (data is Map<String, dynamic>) {
        if (data.containsKey(tokenKey)) {
          return data[tokenKey]?.toString();
        }

        if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
          final innerData = data['data'] as Map<String, dynamic>;
          return innerData[tokenKey]?.toString();
        }
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("Error extracting token: $e");
      }
      return null;
    }
  }
}