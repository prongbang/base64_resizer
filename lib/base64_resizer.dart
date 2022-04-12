import 'dart:typed_data';

export 'binding/image_base64_resizer_native_library.dart';
export 'image_base64_resizer.dart';
export 'loader/dynamic_library_loader.dart';

abstract class Base64Resizer {
  Future<Uint8List> resizeWithPercent(String b64, int percent);

  Future<Uint8List> resizeWithSize(String b64, int width, int height);
}
