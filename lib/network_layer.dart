library;

import 'package:network_layer/api_methods_impl.dart';
import 'api_config.dart';
import 'api_methods.dart';
import 'helpers/base_api_result.dart';
import 'helpers/http_request_type.dart';

export 'helpers/http_request_type.dart';
export 'package:network_layer/network_layer.dart';

class NetworkLayer {
  static final ApiMethods _api = ApiMethodsImpl();

  static void init({required String baseUrl}) {
    ApiConfig.init(baseUrl: baseUrl);
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
    );
  }
}
