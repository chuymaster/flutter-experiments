import 'package:flutter/material.dart';

class TransitionPage extends StatelessWidget {
  const TransitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PageAへ遷移する',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[300], onPrimary: Colors.black),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                    return _PageA();
                  }));
                },
                child: Text('遷移'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageA extends StatelessWidget {
  const _PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PageA',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange, onPrimary: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('戻る'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
