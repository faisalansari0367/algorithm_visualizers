import 'package:algorithm_visualizers/pages/n_queens/n_queens_screen.dart';
import 'package:algorithm_visualizers/pages/sort_screen/cubit/bubble_sort_cubit.dart';
import 'package:algorithm_visualizers/pages/sort_screen/sort_screen.dart';
import 'package:algorithm_visualizers/providers/insertion_sort/insertion_sort_provider.dart';
import 'package:algorithm_visualizers/providers/selection_sort/selection_sort_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = [
    const NQueensScreen(),
    SortScreen(title: 'InsertionSort', sortProvider: InsetionSortProvider()),
    SortScreen(title: 'InsertionSort', sortProvider: InsetionSortProvider()),
    SortScreen(title: 'BubbleSort', sortProvider: BubbleSortProvider()),
    SortScreen(title: 'SelectionSort', sortProvider: SelectionSortProvider()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: itemBuilder,
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return list[index];
  }
}
