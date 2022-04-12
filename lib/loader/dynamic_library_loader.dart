import 'dart:ffi';
import 'dart:io';

class DynamicLibraryLoader {
  static DynamicLibrary load(String name) {
    final DynamicLibrary library = Platform.isAndroid
        ? DynamicLibrary.open(name)
        : DynamicLibrary.process();
    return library;
  }
}
