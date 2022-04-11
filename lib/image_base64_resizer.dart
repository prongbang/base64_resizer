import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:base64_resizer/base64_resizer.dart';
import 'package:base64_resizer/extensions/extensions.dart';

class ImageBase64Resizer implements Base64Resizer {
  final _imageBase64Resizer = ImageBase64ResizerNativeLibrary(Platform.isAndroid
      ? DynamicLibrary.open('libbase64_resizer.so')
      : DynamicLibrary.process());

  @override
  Uint8List resizeWithPercent(String b64, int percent) {
    try {
      final b64Ptr = b64.toPointerInt8();
      final result =
          _imageBase64Resizer.resize_image_with_percent(b64Ptr, percent);
      final list = result.ptr.asTypedList(result.len);

      // Free memory
      _imageBase64Resizer.free_buf(result);
      _imageBase64Resizer.free_string(b64Ptr);

      return list;
    } catch (_) {
      return Uint8List(0);
    }
  }

  @override
  Uint8List resizeWithSize(String b64, int width, int height) {
    try {
      final b64Ptr = b64.toPointerInt8();
      final result =
          _imageBase64Resizer.resize_image_with_size(b64Ptr, width, height);
      final list = result.ptr.asTypedList(result.len);

      // Free memory
      _imageBase64Resizer.free_buf(result);
      _imageBase64Resizer.free_string(b64Ptr);

      return list;
    } catch (_) {
      return Uint8List(0);
    }
  }
}
