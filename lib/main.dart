// import 'package:algorithm_visualizers/sort_screen.dart/sort_screen.dart';
import 'package:algorithm_visualizers/pages/home/home_page.dart';
import 'package:algorithm_visualizers/theme/my_theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Algorithm Visualizer',
      theme: MyTheme.light,
      home: const HomePage(),
    );
  }
}
