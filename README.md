# Network Layer

A simple and lightweight networking package for Flutter applications that provides an easy-to-use interface for making HTTP requests.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
  network_layer:
    git:
      url: https://github.com/SlsabelHesham/Network-Layer
```

Then run:

```bash
flutter pub get
```

## Usage

### Initialize the Network Layer

First, initialize the NetworkLayer with your base URL:

```dart
import 'package:network_layer/network_layer.dart';

NetworkLayer.init(baseUrl: "https://jsonplaceholder.typicode.com");
```

### Making GET Requests

```dart
// Make a GET request
final result = await NetworkLayer.request(
  '/posts/1',
  type: HttpRequestType.get,
);

print(result); // Prints the response data
```

## API Reference

### NetworkLayer.init()

Initialize the network layer with configuration options.

**Parameters:**
- `baseUrl` (String): The base URL for all network requests

### NetworkLayer.request()

Make an HTTP request.

**Parameters:**
- `endpoint` (String): The API endpoint (will be appended to base URL)
- `type` (HttpRequestType): The HTTP method type (get, post, put, delete, etc.)

**Returns:**
- `Future<dynamic>`: The response data from the API
