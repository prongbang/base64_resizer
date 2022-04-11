#import "Base64ResizerPlugin.h"
#if __has_include(<base64_resizer/base64_resizer-Swift.h>)
#import <base64_resizer/base64_resizer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "base64_resizer-Swift.h"
#endif

@implementation Base64ResizerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBase64ResizerPlugin registerWithRegistrar:registrar];
}
@end
