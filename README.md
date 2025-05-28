# Network Layer

A simple and lightweight networking package for Flutter applications that provides an easy-to-use interface for making HTTP requests with built-in authentication, token management, and error handling.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  network_layer:
    git:
      url: https://github.com/SlsabelHesham/Network-Layer
```

## Quick Start

### 1. Initialize the Network Layer

First, initialize the NetworkLayer with your base URL:

```dart
import 'package:network_layer/network_layer.dart';

void main() {
  // Basic initialization
  NetworkLayer.init(baseUrl: "https://jsonplaceholder.typicode.com");
  
  runApp(MyApp());
}
```

### 2. Making Simple GET Requests

```dart
// Make a GET request
final result = await NetworkLayer.request(
  '/posts/1',
  type: HttpRequestType.get,
);

print(result); // Prints the response data
```

## Advanced Usage

### Authentication Setup

For applications requiring authentication, set up the network layer with an auth interceptor:

```dart
void setupNetworkLayer() {
  final authInterceptor = AuthInterceptor(
    refreshTokenEndpoint: '/api/Authorization/RefreshToken',
    onRefreshFailed: () {
      // Handle refresh token failure (e.g., redirect to login)
      print('Refresh failed - redirecting to login');
    },
  );

  NetworkLayer.init(
    baseUrl: "https://your-api-base-url.com",
    authInterceptor: authInterceptor,
  );
}
```

### Generic Response Handling

Use generic types for type-safe response handling:

```dart
// Define your response model
class LoginResponse {
  final String token;
  final User user;
  
  LoginResponse({required this.token, required this.user});
  
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}

// Make a request with generic type
final response = await NetworkLayer.request<LoginResponse>(
  'api/Authorization/Login',
  type: HttpRequestType.post,
  data: {
    "email": "user@example.com",
    "password": "password123",
    "rememberMe": true
  },
  hasToken: false,
  fromJsonT: (json) => LoginResponse.fromJson(json),
);

if (response.error == null) {
  final loginData = response.data;
  print('Welcome ${loginData?.user.name}');
} else {
  print('Login failed: ${response.error!.errorMessage}');
}
```

### Token Management

The package automatically handles token storage and refresh:

```dart
// Set tokens after successful login
final accessToken = loginData.response.token.accessToken;
final refreshToken = loginData.response.token.refreshToken;

NetworkLayer.authTokenManager.setAccessToken(accessToken);
NetworkLayer.authTokenManager.setRefreshToken(refreshToken);

// Make authenticated requests
final result = await NetworkLayer.request(
  'api/user/profile',
  type: HttpRequestType.get,
  hasToken: true, // This will automatically include the auth token
);
```
