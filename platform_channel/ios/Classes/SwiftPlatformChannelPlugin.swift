import Flutter
import Reachability
import UIKit

public class SwiftPlatformChannelPlugin: NSObject, FlutterPlugin {
  var reachability: Reachability?
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "platform_channel", binaryMessenger: registrar.messenger())
    let instance = SwiftPlatformChannelPlugin()
    instance.reachability = Reachability.forInternetConnection()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "isReachable" {
      result(reachability?.isReachable() ?? false)
    } else if call.method == "getPlatformVersion" {
      result("iOS " + UIDevice.current.systemVersion)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
