import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BubbleSortCubit extends ChangeNotifier {
  List<int> array = [];
  int selectedIndex = -1;
  int nextIndex = -1;
  int iterations = 0;
  bool isSorted = false;
  String status = 'Start sorting';
  double speed = 500;

  void setSpeed(double value) {
    speed = value * 1000;
    notifyListeners();
  }

  BubbleSortCubit({required this.array});

  Future<void> bubbleSort() async {
    iterations = 0;
    notifyListeners();
    for (var i = 0; i < array.length; i++) {
      // selectedIndex = i;
      // notifyListeners();
      for (var j = 0; j < array.length - i - 1; j++) {
        iterations++;
        // notifyListeners();
        final current = array[j];
        selectedIndex = j;
        notifyListeners();
        await speed.milliseconds.delay();
        final next = array[j + 1];
        nextIndex = j + 1;
        notifyListeners();
        await speed.milliseconds.delay();

        if (current > next) {
          status = '$current is greater than $next so swap them';
          await Future.delayed(100.milliseconds);
          final temp = current;
          array[j] = next;
          array[j + 1] = temp;
          // (copyWith(array: array));
          notifyListeners();
        } else {
          status = '$current is less than $next so no swap';
          notifyListeners();
          await Future.delayed(100.milliseconds);
        }
      }
    }
    isSorted = true;
    selectedIndex = -1;
    nextIndex = -1;
    // iterations = 0;
    status = 'Array is sorted';
    notifyListeners();
  }

  void shuffleArray() {
    final _array = List.generate(20, (index) => Random().nextInt(100));
    array = [..._array.toSet().toList()];

    notifyListeners();
  }
}
