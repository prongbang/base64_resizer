import 'dart:ffi';

import 'package:ffi/ffi.dart';

extension PointerInt8Extension on Pointer<Int8> {
  String toDartString() {
    return cast<Utf8>().toDartString();
  }
}
