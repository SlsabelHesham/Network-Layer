import 'package:dio/dio.dart';

import '../constants/api_urls.dart';

mixin AppInterceptorHandler {
  late Dio dio;

  // when accessToken is expired & having multiple requests call
  // this variable to lock others request to make sure only trigger call refresh token 01 times
  // to prevent duplicate refresh call
  bool _isRefreshing = false;

  // when having multiple requests call at the same time, you need to store them in a list
  // then loop this list to retry every request later, after call refresh token success
  final _requestsNeedRetry = <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  Future handleApiError(Dio requesterDio, DioException dioError, ErrorInterceptorHandler handler) async {
    dio = requesterDio;

    final response = dioError.response;

    if (response != null &&
        response.statusCode == 403 &&
        // refresh token call maybe fail by it self
        // eg: when refreshToken also is expired -> can't get new accessToken
        // usually server also return 401 unauthorized for this case
        // need to exclude it to prevent loop infinite call
        response.requestOptions.path != ApiUrls.baseUrl) {
      // if hasn't not refreshing yet, let's start it
      if (!_isRefreshing) {
        _isRefreshing = true;

        // add request (requestOptions and handler) to queue and wait to retry later
        _requestsNeedRetry.add((options: response.requestOptions, handler: handler));

        // call api refresh token
        final isRefreshSuccess = await _refreshToken();

        if (isRefreshSuccess) {
          // refresh success, loop requests need retry
          bool isError = false;
          for (var requestNeedRetry in _requestsNeedRetry) {
            // don't need set new accessToken to header here, because these retry
            // will go through onRequest callback above (where new accessToken will be set to header)

            // won't use await because this loop will take longer -> maybe throw: Unhandled Exception: Concurrent modification during iteration
            // because method _requestsNeedRetry.add() is called at the same time
            // final response = await dio.fetch(requestNeedRetry.options);
            // requestNeedRetry.handler.resolve(response);

            // prevent duplicate of the host url as the  path has already the host url in it
            requestNeedRetry.options.path = requestNeedRetry.options.path.split("${dio.options.baseUrl}/").last;

            // prevent duplicate in formData reference
            if (requestNeedRetry.options.data.runtimeType == FormData) {
              requestNeedRetry.options.data = requestNeedRetry.options.data.clone();
            }

            await dio.fetch(requestNeedRetry.options).then((response) {
              requestNeedRetry.handler.resolve(response);
            }).catchError((e, s) {
              isError = true;
              handler.next(e);
            });
          }

          if (isError) return;

          _requestsNeedRetry.clear();
          _isRefreshing = false;
        } else {
          _requestsNeedRetry.clear();
          // if refresh fail, force logout user here
        }
      } else {
        // if refresh flow is processing, add this request to queue and wait to retry later
        _requestsNeedRetry.add((options: response.requestOptions, handler: handler));
      }
    } else {
      // ignore other error is not unauthorized
      return handler.next(dioError);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      //final refreshToken = await getRefreshTokenFromLocalStorage();
      Response res = await callApiRefreshToken("refreshToken");
      if (res.statusCode == 200) {
        // save new access + refresh token to your local storage for using later
        //await setAccessTokenToLocalStorage(res.data['data']['access_token']);
        //await setRefreshTokenToLocalStorage(res.data['data']['refresh_token']);

        dio.options.headers['Authorization'] = 'Bearer ${await "getAccessTokenFromLocalStorage()"}';

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

  callApiRefreshToken(refreshToken) {
    String baseUrl = "";
    if (dio.options.baseUrl.endsWith('/')) {
      baseUrl = dio.options.baseUrl.substring(0, dio.options.baseUrl.length - 1);
    }

    return dio.post('$baseUrl/${ApiUrls.baseUrl}',
        data: FormData.fromMap({
          "refresh_token": refreshToken,
        }));
  }

  /*
  getRefreshTokenFromLocalStorage() async {
    return await ProviderScope.containerOf(Routes.navigatorKey.currentContext!, listen: false)
        .read(sharedPreferencesControllerProvider)
        .retrieve(CacheType.refreshToken);
  }

  getAccessTokenFromLocalStorage() async {
    return await ProviderScope.containerOf(Routes.navigatorKey.currentContext!, listen: false)
        .read(sharedPreferencesControllerProvider)
        .retrieve(CacheType.token);
  }

  Future setAccessTokenToLocalStorage(accessToken) async {
    await ProviderScope.containerOf(Routes.navigatorKey.currentContext!, listen: false)
        .read(sharedPreferencesControllerProvider)
        .cache(cacheType: CacheType.token, value: accessToken);
  }

  Future setRefreshTokenToLocalStorage(refreshToken) async {
    await ProviderScope.containerOf(Routes.navigatorKey.currentContext!, listen: false)
        .read(sharedPreferencesControllerProvider)
        .cache(cacheType: CacheType.refreshToken, value: refreshToken);
  }
  */
}
