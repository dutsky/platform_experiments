import Flutter
import UIKit

public class SwiftPlatformExperimentsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "platform_experiments", binaryMessenger: registrar.messenger())
    let instance = SwiftPlatformExperimentsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [Int]
    let first = args?[0] ?? 0
    let second = args?[1] ?? 0
        
    switch call.method {
    case "multiply":
      result(first * second)
    case "divide":
      result(Double(first) / Double(second))
    case "add":
      result(first + second)
    case "subtract":
      result(first - second)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
