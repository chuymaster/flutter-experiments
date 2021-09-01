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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isPortrait = height > width;
    return Center(
        child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 650),
      child: Column(
        children: [
          const _Spacer(),
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
          const _Spacer(),
          if (isPortrait)
            FlutterLogo(
              size: height * 0.3,
            ),
          if (isPortrait) const _Spacer(),
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
          const _Spacer(),
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
          const _Spacer()
        ],
      ),
    ));
  }
}

class _Spacer extends StatelessWidget {
  const _Spacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Spacer();
  }
}
