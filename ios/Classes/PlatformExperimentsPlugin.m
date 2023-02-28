#import "PlatformExperimentsPlugin.h"
#if __has_include(<platform_experiments/platform_experiments-Swift.h>)
#import <platform_experiments/platform_experiments-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "platform_experiments-Swift.h"
#endif

@implementation PlatformExperimentsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPlatformExperimentsPlugin registerWithRegistrar:registrar];
}
@end
