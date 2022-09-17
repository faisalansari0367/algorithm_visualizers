// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // import 'sort_screen.dart/widgets/array.dart';
// import 'sort_screen/widgets/array.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late List<int> array;
//   @override
//   void initState() {
//     generateArray();
//     super.initState();
//   }

//   void _incrementCounter() {
//     setState(() {
//       array = array.reversed.toList();
//     });
//   }

//   void generateArray() {
//     array = List.generate(20, (index) => Random().nextInt(100));
//     array = array.toSet().toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 10),
//           const Expanded(
//             child: ArrayWidget(),
//           ),
//           ElevatedButton(
//             onPressed: onPressed,
//             child: const Text('Sort Array'),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: unsortArray,
//             child: const Text('Unsort Array'),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void unsortArray() {
//     setState(() {
//       generateArray();
//     });
//   }

//   void onPressed() async {
//     var iterations = 0;
//     for (var i = 0; i < array.length; i++) {
//       for (var j = 0; j < array.length - i - 1; j++) {
//         iterations++;
//         debugPrint('total iterations: $iterations');
//         final current = array[j];
//         final next = array[j + 1];
//         if (current > next) {
//           await Future.delayed(500.milliseconds);
//           final temp = current;
//           array[j] = next;
//           array[j + 1] = temp;
//           setState(() {});
//         }
//       }
//       print(array);
//     }
//   }
// }
