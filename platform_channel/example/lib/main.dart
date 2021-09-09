import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:platform_channel/platform_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isReachable = false;

  Future<void> onTap() async {
    try {
      _isReachable = await PlatformChannel.isReachable;
    } on PlatformException {
      _isReachable = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await PlatformChannel.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Running on: $_platformVersion\n'),
              Text(_isReachable ? 'ネットワークに接続されています\n' : 'ネットワークに接続されていません\n'),
              StreamBuilder(
                  initialData: 0,
                  stream: PlatformChannel.onNetworkStateChange(),
                  builder: (context, snapshot) {
                    final networkState = snapshot.data as int;
                    switch (networkState) {
                      case 1:
                        return Text('モバイル回線経由で接続しています\n');
                      case 2:
                        return Text('WiFi経由で接続しています\n');
                      default:
                        return Text('ネットワークに接続されていません\n');
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
