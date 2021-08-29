import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  GridViewPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'grid_on',
            onPressed: () {},
            child: Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
              heroTag: 'grid_off',
              onPressed: () {},
              child: Icon(
                Icons.grid_off,
                color: Colors.white,
              )),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
              heroTag: 'arrow_upward',
              onPressed: () {},
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              )),
        ],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) => Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 42, color: Colors.white),
                  ),
                ),
              )),
    );
  }
}
