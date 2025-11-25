import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {

  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      // debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        primaryColor: Colors.yellow,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      home: HomeScreen(),
      );
  }
}
