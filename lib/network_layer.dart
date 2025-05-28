library;

import 'package:network_layer/api_methods_impl.dart';
import 'api_config.dart';
import 'api_methods.dart';
import 'helpers/base_api_result.dart';
import 'helpers/http_request_type.dart';
import 'interceptors/auth_interceptor.dart';
import 'helpers/auth_token_manager.dart';

export 'helpers/http_request_type.dart';
export 'package:network_layer/network_layer.dart';
export 'helpers/auth_token_manager.dart';

class NetworkLayer {
  static final ApiMethods _api = ApiMethodsImpl();
  static AuthInterceptor? _authInterceptor;
  static final AuthTokenManager _authTokenManager = AuthTokenManager();

  static void init({required String baseUrl, AuthInterceptor? authInterceptor}) {
    ApiConfig.init(baseUrl: baseUrl);
    if (authInterceptor != null) {
      setAuthInterceptor(authInterceptor);
    }
  }

  static Future<BaseApiResult<T>> request<T>(
      String url, {
        required HttpRequestType type,
        Map<String, dynamic>? data,
        Map<String, dynamic>? params,
        bool hasToken = false,
        bool isLanguageAll = false,
        bool hasApiKey = false,
        bool needKey = false,
        String? sessionKey,
        T Function(dynamic json)? fromJsonT
      }) {
    return _api.request<T>(
      url,
      type: type,
      data: data,
      params: params,
      hasToken: hasToken,
      isLanguageAll: isLanguageAll,
      hasApiKey: hasApiKey,
      needKey: needKey,
      sessionKey: sessionKey,
      fromJsonT: fromJsonT,
    );
  }

  static void setAuthInterceptor(AuthInterceptor authInterceptor) {
    _authInterceptor = authInterceptor;
    ApiConfig.setAuthInterceptor(authInterceptor);
  }

  static void removeAuthInterceptor() {
    _authInterceptor = null;
    ApiConfig.removeAuthInterceptor();
  }

  static AuthInterceptor? get authInterceptor => _authInterceptor;

  static String? get baseUrl => ApiConfig.dio.options.baseUrl;

  static AuthTokenManager get authTokenManager => _authTokenManager;

}
