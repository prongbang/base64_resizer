import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

extension Uint8ListExtension on Uint8List {
  /// Allocates a pointer filled with the Uint8List data.
  Pointer<Uint8> allocatePointer() {
    final blob = calloc<Uint8>(length);
    final blobBytes = blob.asTypedList(length);
    blobBytes.setAll(0, this);
    return blob;
  }
}
