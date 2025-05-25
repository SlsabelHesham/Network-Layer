import 'package:dio/dio.dart';

import '../constants/api_urls.dart';

class AuthInterceptor extends InterceptorsWrapper {
  late final Dio dio;

  // when accessToken is expired & having multiple requests call
  // this variable to lock others request to make sure only trigger call refresh token 01 times
  // to prevent duplicate refresh call
  bool _isRefreshing = false;

  // when having multiple requests call at the same time, you need to store them in a list
  // then loop this list to retry every request later, after call refresh token success
  final _requestsNeedRetry =
      <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await getAccessTokenFromLocalStorage();
    options.headers['authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    dio = Dio(BaseOptions(
        baseUrl: err.requestOptions.path,
        headers: err.requestOptions.headers,
        queryParameters: err.requestOptions.queryParameters));

    final response = err.response;
    if (response != null &&
        // status code for unauthorized usually 401
        response.statusCode == 403 &&
        // refresh token call maybe fail by it self
        // eg: when refreshToken also is expired -> can't get new accessToken
        // usually server also return 401 unauthorized for this case
        // need to exlude it to prevent loop infinite call
        response.requestOptions.path != "path/your/endpoint/refresh") {
      // if hasn't not refreshing yet, let's start it
      if (!_isRefreshing) {
        _isRefreshing = true;

        // add request (requestOptions and handler) to queue and wait to retry later
        _requestsNeedRetry
            .add((options: response.requestOptions, handler: handler));

        // call api refresh token
        final isRefreshSuccess = await _refreshToken();

        if (isRefreshSuccess) {
          // refresh success, loop requests need retry
          for (var requestNeedRetry in _requestsNeedRetry) {
            // don't need set new accessToken to header here, because these retry
            // will go through onRequest callback above (where new accessToken will be set to header)

            // won't use await because this loop will take longer -> maybe throw: Unhandled Exception: Concurrent modification during iteration
            // because method _requestsNeedRetry.add() is called at the same time
            // final response = await dio.fetch(requestNeedRetry.options);
            // requestNeedRetry.handler.resolve(response);

            dio.fetch(requestNeedRetry.options).then((response) {
              requestNeedRetry.handler.resolve(response);
            }).catchError((_) {});
          }

          _requestsNeedRetry.clear();
          _isRefreshing = false;
        } else {
          _requestsNeedRetry.clear();
          // if refresh fail, force logout user here
        }
      } else {
        // if refresh flow is processing, add this request to queue and wait to retry later
        _requestsNeedRetry
            .add((options: response.requestOptions, handler: handler));
      }
    } else {
      // ignore other error is not unauthorized
      return handler.next(err);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = getRefreshTokenFromLocalStorage();
      Response res = await callApiRefreshToken(refreshToken);
      if (res.statusCode == 200) {
        // save new access + refresh token to your local storage for using later
        setAccessTokenToLocalStorage(res.data['data']['access_token']);
        setRefreshTokenToLocalStorage(res.data['data']['refresh_token']);
        return true;
      } else {
        print("refresh token fail ${res.statusMessage ?? res.toString()}");
        return false;
      }
    } catch (error) {
      print("refresh token fail $error");
      return false;
    }
  }

  getRefreshTokenFromLocalStorage() async {
    /*
    return await ProviderScope.containerOf(Routes.navigatorKey.currentContext!,
            listen: false)
        .read(sharedPreferencesControllerProvider)
        .retrieve(CacheType.refreshToken);
     */
  }

  callApiRefreshToken(refreshToken) {
    String baseUrl = "";
    if (dio.options.baseUrl.endsWith('/')) {
      baseUrl =
          dio.options.baseUrl.substring(0, dio.options.baseUrl.length - 1);
    }

   return dio.post('$baseUrl/${ApiUrls.baseUrl}',
        data: FormData.fromMap({
          "refresh_token": refreshToken,
        }));
  }

  getAccessTokenFromLocalStorage() async {
    /*
    return await ProviderScope.containerOf(Routes.navigatorKey.currentContext!,
            listen: false)
        .read(sharedPreferencesControllerProvider)
        .retrieve(CacheType.token);
     */
  }

  void setAccessTokenToLocalStorage(accessToken) {}

  void setRefreshTokenToLocalStorage(refreshToken) {}
}
