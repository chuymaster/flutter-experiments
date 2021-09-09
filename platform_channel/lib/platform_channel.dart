import 'dart:async';

import 'package:flutter/services.dart';

class PlatformChannel {
  static const MethodChannel _channel = const MethodChannel('platform_channel');
  static const EventChannel _eventChannel =
      EventChannel('platform_channel/event_channel');

  static Future<bool> get isReachable async {
    return await _channel.invokeMethod('isReachable');
  }

  static Stream<int> onNetworkStateChange() {
    return _eventChannel.receiveBroadcastStream().map((event) => event as int);
  }

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
