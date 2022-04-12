import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:base64_resizer/base64_resizer.dart';
import 'package:base64_resizer/extensions/extensions.dart';
import 'package:ffi/ffi.dart';

class ImageBase64Resizer implements Base64Resizer {
  final _imageBase64Resizer = ImageBase64ResizerNativeLibrary(Platform.isAndroid
      ? DynamicLibrary.open('libbase64_resizer.so')
      : DynamicLibrary.process());

  @override
  Uint8List resizeWithPercent(String b64, int percent) {
    try {
      final Pointer<Int8> b64Ptr = b64.toPointerInt8();
      final Vec_uint8_t result =
          _imageBase64Resizer.resize_image_with_percent(b64Ptr, percent);
      print('len: ${result.len}');
      print('cap: ${result.cap}');
      print('ptr: ${result.ptr.address}');
      final Uint8List list = result.ptr.asTypedList(result.len);
      return list;
    } catch (e) {
      print('error:: $e');
      return Uint8List(0);
    }
  }

  @override
  Uint8List resizeWithSize(String b64, int width, int height) {
    try {
      final Pointer<Int8> b64Ptr = b64.toPointerInt8();
      final Vec_uint8_t result =
          _imageBase64Resizer.resize_image_with_size(b64Ptr, width, height);
      final Uint8List list = result.ptr.asTypedList(result.len);

      // Free memory
      _imageBase64Resizer.free_string(b64Ptr);

      return list;
    } catch (_) {
      return Uint8List(0);
    }
  }

  String rustGreeting() {
    const nameStr = "John Smith";
    final Pointer<Int8> namePtr = nameStr.toNativeUtf8().cast<Int8>();

    final Pointer<Int8> resultPtr = _imageBase64Resizer.to_string(namePtr);

    // Handle the result pointer
    final String greetingStr = resultPtr.cast<Utf8>().toDartString();

    return greetingStr;
  }
}
