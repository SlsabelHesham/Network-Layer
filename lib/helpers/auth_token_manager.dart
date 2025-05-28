import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _consumerKey = 'consumer_key';
  static const String _consumerSecret = 'consumer_secret';

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  Future<void> setAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
  }

  Future<void> setRefreshToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_refreshTokenKey, token);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }

  Future<void> saveConsumerCredentials(String consumerKey, String consumerSecret) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_consumerKey, consumerKey);
    await prefs.setString(_consumerSecret, consumerSecret);
  }

  Future<Map<String, String?>> getConsumerCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'consumerKey': prefs.getString(_consumerKey),
      'consumerSecret': prefs.getString(_consumerSecret),
    };
  }
}
