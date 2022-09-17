import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SortProvider<T> extends ChangeNotifier {
  List<int> array = [];
  int selectedIndex = -1;
  int nextIndex = -1;
  int iterations = 0;
  bool isSorted = false;
  String status = 'Start sorting';
  double speed = 500;
  int sortedArrayIndex = -1;

  SortProvider() {
    shuffleArray();
  }
  void setSpeed(double value) {
    speed = (max(0.01, value) * 1000);
    notifyListeners();
  }

  void setSelectedIndex(int value) {
    selectedIndex = value;
  }

  void setIterations(int value) {
    iterations = value;
  }

  void setNextIndex(int value) {
    nextIndex = value;
  }

  void setStatus(String value) {
    status = value;
  }

  void reset() {
    selectedIndex = -1;
    nextIndex = -1;
    isSorted = false;
    notifyListeners();
  }

  Future<void> wait() async => await speed.milliseconds.delay();

  int getRandomNumber() {
    final random = Random().nextInt(100);
    if (array.contains(random)) {
      return getRandomNumber();
    } else {
      return random;
    }
  }

  void reverseArray() {
    array = array.reversed.toList();
    notifyListeners();
  }

  void shuffleArray() async {
    array.clear();
    for (var i = 0; i <= 20; i++) {
      array.add(getRandomNumber());
    }
    notifyListeners();
  }

  Future<void> sortMethod();
}
