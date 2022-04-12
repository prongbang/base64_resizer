import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:base64_resizer/base64_resizer.dart';
import 'package:base64_resizer/extensions/extensions.dart';

class ImageBase64Resizer implements Base64Resizer {
  final _dynamicLibrary = Platform.isAndroid
      ? DynamicLibrary.open('libbase64_resizer.so')
      : DynamicLibrary.process();

  @override
  Future<Uint8List> resizeWithPercent(String b64, int percent) async {
    final imageBase64Resizer = ImageBase64ResizerNativeLibrary(_dynamicLibrary);
    try {
      final Pointer<Int8> b64Ptr = b64.toPointerInt8();
      final Vec_uint8_t result =
          imageBase64Resizer.resize_image_with_percent(b64Ptr, percent);
      print('len: ${result.len}');
      print('cap: ${result.cap}');
      print('ptr: ${result.ptr.address}');
      final Uint8List list = result.ptr.asTypedList(result.len);

      imageBase64Resizer.free_buf(result);
      imageBase64Resizer.free_string(b64Ptr);

      return list;
    } catch (e) {
      print('error:: $e');
      return Uint8List(0);
    }
  }

  @override
  Future<Uint8List> resizeWithSize(String b64, int width, int height) async {
    final imageBase64Resizer = ImageBase64ResizerNativeLibrary(_dynamicLibrary);
    try {
      final Pointer<Int8> b64Ptr = b64.toPointerInt8();
      final Vec_uint8_t result =
          imageBase64Resizer.resize_image_with_size(b64Ptr, width, height);
      final Uint8List list = result.ptr.asTypedList(result.len);

      // Free memory
      imageBase64Resizer.free_string(b64Ptr);

      return list;
    } catch (_) {
      return Uint8List(0);
    }
  }

  Future<String> rustGreeting() async {
    final imageBase64Resizer = ImageBase64ResizerNativeLibrary(_dynamicLibrary);
    const nameStr = "John Smith";
    final Pointer<Int8> namePtr = nameStr.toPointerInt8();

    final Pointer<Int8> resultPtr = imageBase64Resizer.to_string(namePtr);

    // Handle the result pointer
    final String greetingStr = resultPtr.toDartString();

    imageBase64Resizer.free_string(resultPtr);

    return greetingStr;
  }
}
