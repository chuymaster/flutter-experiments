import 'package:flutter/material.dart';
import 'package:stateful_sample/todos_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodosListPage(),
    );
  }
}
