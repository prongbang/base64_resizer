import 'dart:typed_data';

export 'dynamic_library_loader.dart';
export 'image_base64_resizer.dart';
export 'image_base64_resizer_native_library.dart';

abstract class Base64Resizer {
  Uint8List resizeWithPercent(String b64, int percent);

  Uint8List resizeWithSize(String b64, int width, int height);
}
