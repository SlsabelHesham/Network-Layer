mixin CookiesFilter {
  String getSessionKeyHeader(Map<String, List<String>> headers) {
    List<String> cookies = [];
    String cartCookies = '';
    if (headers.containsKey('set-cookie')) {
      cookies = headers['set-cookie'] ?? [];
    }

    if (cookies.isNotEmpty) {
      for (String cookie in cookies) {
        if (cookie.contains('wp_woocommerce_session') &&
            !cookie.contains('deleted')) {
          cartCookies = cookie;
          break;
        }
      }
    }

    if (cartCookies.contains('wp_woocommerce_session')) {
      return cartCookies;
    }
    return '';
  }

  getSessionKeyLinkParam(String sessionKey) {
    List<String> parts = sessionKey.split("=");
    String key = parts[0];
    String sessionValue = parts[1].split(";")[0];

    String result = "$key&session_value=$sessionValue";
    return result;
  }
}
