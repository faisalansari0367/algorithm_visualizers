// import 'package:algorithm_visualizers/sort_screen.dart/sort_screen.dart';
import 'package:flutter/material.dart';

import 'sort_screen/sort_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: const Color(0xffeff3f6),
        primaryColor: const Color.fromARGB(255, 93, 93, 93),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // backgroundColor: const Color(0xffeff3f6),
            shape: const StadiumBorder(),
          ),
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff1772f6),
              onPrimary: Colors.white,
              secondary: const Color.fromARGB(255, 255, 34, 226),
              onSecondary: Colors.white,
              primaryContainer: const Color(0xffeff3f6),
              onPrimaryContainer: const Color(0xffeff3f6),
            ),
      ),
      home: const BubbleSort(),
    );
  }
}
