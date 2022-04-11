
import 'dart:async';

import 'package:flutter/services.dart';

class Base64Resizer {
  static const MethodChannel _channel = MethodChannel('base64_resizer');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
