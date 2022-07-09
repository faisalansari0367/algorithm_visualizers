// part of 'bubble_sort_cubit.dart';


import 'package:equatable/equatable.dart';

class BubbleSortState extends Equatable {
  final int selectedIndex;
  final int nextIndex;
  final List<int> array;
  final int iterations;
  final bool isSorted;
  // final int previousIndex;

  const BubbleSortState({
    required this.array,
    this.iterations = 0,
    this.isSorted = false,
    this.selectedIndex = 0,
    this.nextIndex = 0,
  });

  @override
  List<Object?> get props => [selectedIndex, nextIndex, array, iterations, isSorted];

  BubbleSortState copyWith({
    int? selectedIndex,
    int? nextIndex,
    List<int>? array,
    int? iterations,
    bool? isSorted,
  }) {
    return BubbleSortState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      nextIndex: nextIndex ?? this.nextIndex,
      array: array ?? this.array,
      iterations: iterations ?? this.iterations,
      isSorted: isSorted ?? this.isSorted,
    );
  }
}
