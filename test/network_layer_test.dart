import 'package:flutter_test/flutter_test.dart';
import 'package:network_layer/interceptors/auth_interceptor.dart';
import 'package:network_layer/network_layer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    setupNetworkLayer();
  });

  test('test login', () async {
    final response = await NetworkLayer.request<LoginResponse>(
        'api/Authorization/Login',
        type: HttpRequestType.post,
        data: {
          "email": "ahmed.salah111@hotmail.com",
          "password": "Iskra@1234",
          "rememberMe": true
        },
        hasToken: false,
        fromJsonT: (json) {
          return LoginResponse.fromJson(json);
        }
    );

    expect(response, isNotNull);

    if (response.error != null) {
      print("❌ Error: ${response.error!.errorMessage}");
    } else {
      final loginData = response.data;
      if (loginData != null) {
        final accessToken = loginData.response.token.accessToken;
        final refreshToken = loginData.response.token.refreshToken;
        NetworkLayer.authTokenManager.setAccessToken(accessToken);
        NetworkLayer.authTokenManager.setRefreshToken(refreshToken);
      }
    }

    final test = await NetworkLayer.request(
      'api/MeterRequest/GetMeterRequests',
      type: HttpRequestType.get,
      hasToken: true,
    );
    expect(test, isNotNull);
  });
}


void setupNetworkLayer() {
  final authInterceptor = AuthInterceptor(
    refreshTokenEndpoint: '/api/Authorization/RefreshToken',
    onRefreshFailed: () {
      print('Refresh failed');
    },
  );

  NetworkLayer.init(
    baseUrl: "https://energy360.iskraemeco.com.eg:50",
    authInterceptor: authInterceptor,
  );
}

class LoginResponse {
  final LoginData response;

  LoginResponse({required this.response});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('token') ||
        !json.containsKey('userId') ||
        !json.containsKey('username')) {
      throw Exception('Missing required fields in login response');
    }

    return LoginResponse(
      response: LoginData.fromJson(json),
    );
  }
}

class LoginData {
  final TokenData token;
  final String userId;
  final String username;
  final List<String>? roles;
  final Map<String, dynamic>? claims;
  final String? firebaseToken;
  final FirebaseConfig? firebaseConfig;
  final bool isSupportPurchaseMeter;

  LoginData({
    required this.token,
    required this.userId,
    required this.username,
    this.roles,
    this.claims,
    this.firebaseToken,
    this.firebaseConfig,
    required this.isSupportPurchaseMeter
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: TokenData.fromJson(json['token'] as Map<String, dynamic>),
      userId: json['userId'] as String,
      username: json['username'] as String,
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
      claims: json['claims'] as Map<String, dynamic>?,
      firebaseToken: json['firebaseToken'] as String?,
      firebaseConfig: json['firebaseConfig'] != null
          ? FirebaseConfig.fromJson(
          json['firebaseConfig'] as Map<String, dynamic>)
          : null,
      isSupportPurchaseMeter: json['isSupportPurchaseMeter'] as bool,
    );
  }
}

class TokenData {
  final String accessToken;
  final String refreshToken;
  final String expires;

  TokenData({
    required this.accessToken,
    required this.refreshToken,
    required this.expires,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) {
    return TokenData(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expires: json['expires'] as String,
    );
  }
}

class FirebaseConfig {
  final String apiKey;
  final String projectId;
  final String senderId;
  final String androidAppId;
  final String iosAppId;

  FirebaseConfig({
    required this.apiKey,
    required this.projectId,
    required this.senderId,
    required this.androidAppId,
    required this.iosAppId,
  });

  factory FirebaseConfig.fromJson(Map<String, dynamic> json) {
    return FirebaseConfig(
      apiKey: json['apiKey'] as String,
      projectId: json['projectId'] as String,
      senderId: json['senderId'] as String,
      androidAppId: json['androidAppId'] as String,
      iosAppId: json['iosAppId'] as String,
    );
  }
}