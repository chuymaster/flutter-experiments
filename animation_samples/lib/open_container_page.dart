import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class OpenContainerPage extends StatelessWidget {
  const OpenContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: [
          for (var index = 0; index < HeroImages.titles.length; index++)
            OpenContainer(
              closedBuilder: (_, openContainer) {
                return GestureDetector(
                  onTap: openContainer,
                  child: ImageItem(
                    url: HeroImages.urls[index],
                  ),
                );
              },
              openBuilder: (_, closeContainer) {
                return LargeImagePage(
                  index: index,
                  onTap: closeContainer,
                );
              },
              openColor: Colors.black87,
              closedColor: Colors.black87,
              closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0))),
            )
        ],
      ),
    );
  }
}

class LargeImagePage extends StatelessWidget {
  const LargeImagePage({Key? key, required this.index, required this.onTap})
      : super(key: key);

  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(HeroImages.titles[index]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: ImageItem(
                url: HeroImages.urls[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Container(
        color: Colors.grey[200],
        child: Center(child: CircularProgressIndicator()),
      ),
      fit: BoxFit.cover,
    );
  }
}

class HeroImages {
  static const List<String> titles = ['Bear', 'Tiger', 'Turtle', 'Dolphin'];
  static const List<String> urls = [
    'https://images.pexels.com/photos/451230/pexels-photo-451230.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/40661/tiger-snow-growling-zoo-40661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/1618606/pexels-photo-1618606.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://images.pexels.com/photos/3439576/pexels-photo-3439576.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
  ];
}
