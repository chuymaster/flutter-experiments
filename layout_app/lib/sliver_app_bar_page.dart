import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blueAccent.withOpacity(0.3),
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 180,
            toolbarHeight: 60,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('記事カテゴリー'),
              background: Container(
                width: double.infinity,
                child: Image.network(
                  'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Text('Sep. 29 2020')),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              color: Colors.blueAccent,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ]))
        ],
      ),
    );
  }
}
