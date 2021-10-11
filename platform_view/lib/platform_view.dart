import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformWebViewWidget extends StatelessWidget {
  const PlatformWebViewWidget({Key? key, required this.initialUrl})
      : super(key: key);

  final String initialUrl;

  @override
  Widget build(BuildContext context) {
    const viewType = 'platform-web-view';
    final creationParams = <String, dynamic>{
      'initialUrl': initialUrl,
    };

    if (Platform.isAndroid) {
      return AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}

class PlatformWebViewController {
  static const MethodChannel _channel =
      MethodChannel('platform-web-view/channel');

  Future<void> loadUrl(String url) async {
    return await _channel.invokeMethod('loadUrl', {"url": url});
  }

  Future<void> goBack() async {
    return await _channel.invokeMethod('goBack');
  }

  Future<void> goForward() async {
    return await _channel.invokeMethod('goForward');
  }
}
