import 'package:flutter/material.dart';

class ResponsiveDesignPage extends StatelessWidget {
  const ResponsiveDesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(title: Text('様々なデバイスに対応する')),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const _FixedHeightSizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            "Flutter is Google's UI toolkit for building beautiful, natively compiled",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.85,
                fontWeight: FontWeight.bold),
          ),
        ),
        const _FixedHeightSizedBox(),
        FlutterLogo(
          size: 240,
        ),
        const _FixedHeightSizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
              'Fast Development Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.85,
                  fontWeight: FontWeight.bold)),
        ),
        const _FixedHeightSizedBox(),
        SizedBox(
            height: 42,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(color: Colors.white),
                  primary: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            )),
        const _FixedHeightSizedBox()
      ],
    ));
  }
}

class _FixedHeightSizedBox extends StatelessWidget {
  const _FixedHeightSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
    );
  }
}
