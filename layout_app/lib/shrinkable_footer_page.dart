import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShrinkableFooterPage extends StatefulWidget {
  const ShrinkableFooterPage({Key? key}) : super(key: key);

  @override
  _ShrinkableFooterPageState createState() => _ShrinkableFooterPageState();
}

class _ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  final _scrollController = ScrollController();
  bool isHiding = false;

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomNavigationBar(
        isHiding: isHiding,
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 50),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Color(0xFFFEEAE6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'スクロールに応じて\nBottomNavigationBarが\n縮みます。',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF442C2E),
                        height: 1.2),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.network(
                'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            SizedBox(
              height: 20,
            ),
            Image.network(
                'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            SizedBox(
              height: 20,
            ),
            Image.network(
                'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            SizedBox(
              height: 20,
            ),
            Image.network(
                'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            SizedBox(
              height: 20,
            ),
            Image.network(
                'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _listenScroll() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isHiding = true;
      } else {
        isHiding = false;
      }
      setState(() {});
    });
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key, required this.isHiding})
      : super(key: key);

  final bool isHiding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      height: isHiding ? 32 : 60,
      color: Color(0xFFFEEAE6),
      duration: Duration(milliseconds: 200),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconTextItem(deviceWidth: width, icon: Icons.home, title: 'Home'),
            _IconTextItem(
                deviceWidth: width, icon: Icons.star, title: 'Favorite'),
            _IconTextItem(
                deviceWidth: width, icon: Icons.favorite, title: 'Like'),
            _IconTextItem(
                deviceWidth: width, icon: Icons.settings, title: 'Menu')
          ],
        ),
      ),
    );
  }
}

class _IconTextItem extends StatelessWidget {
  const _IconTextItem(
      {Key? key,
      required this.deviceWidth,
      required this.icon,
      required this.title})
      : super(key: key);

  final double deviceWidth;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.25 * (deviceWidth - 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFF442C2E),
            size: 24,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
