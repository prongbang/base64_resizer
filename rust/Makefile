
gen_header:
	cargo test --features c-headers -- generate_headers
	cp -a ./header/base64_resizer.h ../ios/Classes

gen_a:
	cargo lipo --release
	cp ./target/universal/release/libbase64_resizer.a ../ios
	cp ./target/universal/release/libbase64_resizer.a ./lipo

gen_so:
	cargo ndk -t armeabi-v7a -t arm64-v8a -t x86 -o ./jniLibs build --release
	cp -a ./jniLibs ../android/src/main


# --------------------------------- flutter_rust_bridge (Error!) ---------------------------------
# Requirement
# cargo install cbindgen
# dart pub global activate ffigen
# cargo install flutter_rust_bridge_codegen
gen_rust_dart_header:
	flutter_rust_bridge_codegen --rust-input src/lib.rs --rust-output src/base64_resizer.rs --dart-output dart/base64_resizer.dart --c-output header/base64_resizer.h
