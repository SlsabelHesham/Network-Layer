import 'package:flutter_test/flutter_test.dart';

import 'package:network_layer/network_layer.dart';

void main() {
  test('test get request', () async {
    NetworkLayer.init(baseUrl: "https://jsonplaceholder.typicode.com");
    final result = await NetworkLayer.request(
      '/posts/-100',
      type: HttpRequestType.get,
    );

    final test = await NetworkLayer.request(
      '/posts/100',
      type: HttpRequestType.get,
    );

    expect(result, isNotNull);
    expect(test, isNotNull);
    print(result);
    print(test);
  });
}
