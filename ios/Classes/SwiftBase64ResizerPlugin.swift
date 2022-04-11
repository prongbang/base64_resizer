import Flutter
import UIKit

public class SwiftBase64ResizerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "base64_resizer", binaryMessenger: registrar.messenger())
    let instance = SwiftBase64ResizerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  public func dummyMethodToEnforceBundling() {
      // This will never be executed
      resize_image_with_percent("", 0);
      resize_image_with_size("", 0, 0);
      resize_image("", 0, 0, 0);
  }
}
