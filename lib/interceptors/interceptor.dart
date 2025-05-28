import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:network_layer/helpers/auth_token_manager.dart';

import '../../constants/keys.dart';
import '../api_config.dart';
import '../handlers/interceptor_handler.dart';

class AppInterceptor extends Interceptor with AppInterceptorHandler {
  static final AuthTokenManager _authTokenManager = AuthTokenManager();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // After Login we will use an api to retrive consumer key and password and save them gloabl to use here , for now thay are static
    String baseUrl = options.baseUrl;

    //slsabel edit
    //String consumerKey = FlavorConfig.instance.variables["consumerKey"];
    //String consumerSecret = FlavorConfig.instance.variables["consumerSecret"];

    if (baseUrl.endsWith('/')) {
      baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    }

    if (!(options.extra[Keys.doNotInterceptKey] ?? false)) {
      if (options.extra.containsKey(Keys.apiKeyRequired) && (options.extra[Keys.apiKeyRequired] as bool)) {}

      if (options.extra.containsKey(Keys.authorizationRequired) &&
          (options.extra[Keys.authorizationRequired] as bool)) {
        options.headers[Keys.authorization] = 'Bearer ${await _authTokenManager.getAccessToken()}';
      }
      //slsabel edit
      final credentials = await _authTokenManager.getConsumerCredentials();
      final consumerKey = credentials['consumerKey'];
      final consumerSecret = credentials['consumerSecret'];

      if (options.extra.containsKey(Keys.consumerKeyRequired) && (options.extra[Keys.consumerKeyRequired] as bool)) {
        String basicAuth = 'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}';
        options.headers['Authorization'] = basicAuth;

        options.path = '$baseUrl/${options.path}';
      } else {
        options.path = '$baseUrl/${options.path}';
      }
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    await handleApiError(ApiConfig.dio, err, handler);
    // super.onError(err, handler);
  }

  //slsabel edit
  /*static Future<String> get _token async =>
        await ProviderScope.containerOf(Routes.navigatorKey.currentContext!, listen: false)
            .read(sharedPreferencesControllerProvider)
            .retrieve(CacheType.token);*/
}
