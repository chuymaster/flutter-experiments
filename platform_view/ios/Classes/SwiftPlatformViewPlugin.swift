import Flutter
import UIKit
import WebKit

public class SwiftPlatformViewPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = FLWebFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: "platform-web-view")
    }
}

class FLWebFactory: NSObject, FlutterPlatformViewFactory {
    private weak var messenger: FlutterBinaryMessenger?
    init(messenger: FlutterBinaryMessenger) {
        super.init()
        self.messenger = messenger
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        FLWebView(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLWebView: NSObject, FlutterPlatformView {
    private var webView: WKWebView?
    
    init(frame _: CGRect, viewIdentifier _: Int64, arguments: Any?, binaryMessenger messenger: FlutterBinaryMessenger?) {
        super.init()
        let params = arguments as! [String: String]
        let initialUrl = params["initialUrl"]!
        webView = WKWebView()
        webView?.load(URLRequest(url: URL(string: initialUrl)!))
        
        // For channel operations
        let channel = FlutterMethodChannel(name: "platform-web-view/channel", binaryMessenger: messenger!)
        channel.setMethodCallHandler { [weak self] call, result in
            switch call.method {
            case "loadUrl":
                let arguments = call.arguments as! [String: String]
                guard let url = arguments["url"], !url.isEmpty else {
                    result(FlutterError(code: "InvalidUrl", message: "無効なURLです", details: nil))
                    return
                }
                self?.loadUrl(url: url)
                result(nil)
            case "goBack":
                self?.goBack()
                result(nil)
            case "goForward":
                self?.goForward()
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
    
    func view() -> UIView {
        webView!
    }
    
    func loadUrl(url: String) {
        webView?.load(URLRequest(url: URL(string: url)!))
    }
    
    func goBack() {
        webView?.goBack()
    }
    
    func goForward() {
        webView?.goForward()
    }
}
