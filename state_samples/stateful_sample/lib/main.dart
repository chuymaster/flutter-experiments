import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TodosListPage extends StatefulWidget {
  const TodosListPage({Key? key}) : super(key: key);

  @override
  _TodosListPageState createState() => _TodosListPageState();
}

class _TodosListPageState extends State<TodosListPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
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
