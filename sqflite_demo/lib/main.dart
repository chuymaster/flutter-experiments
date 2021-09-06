import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_demo/utilities/initialize_database.dart';

import 'pages/home_screen.dart';
import 'providers/todo_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await initializeDatabase();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TodoProvider(database: database))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen.withDependencies(context: context),
    );
  }
}
