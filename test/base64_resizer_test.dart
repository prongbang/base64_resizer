import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:base64_resizer/base64_resizer.dart';

void main() {
  const MethodChannel channel = MethodChannel('base64_resizer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Base64Resizer.platformVersion, '42');
  });
}
