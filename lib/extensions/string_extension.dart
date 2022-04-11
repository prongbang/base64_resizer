import 'dart:ffi';

import 'package:ffi/ffi.dart';

extension StringExtension on String {
  Pointer<Int8> toPointerInt8() {
    final Pointer<Int8> base64Ptr = toNativeUtf8().cast<Int8>();
    return base64Ptr;
  }
}
