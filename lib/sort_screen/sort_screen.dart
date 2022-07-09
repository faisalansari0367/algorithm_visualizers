import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'cubit/bubble_sort_cubit.dart';
import 'widgets/array.dart';

class BubbleSort extends StatefulWidget {
  const BubbleSort({Key? key}) : super(key: key);

  @override
  State<BubbleSort> createState() => _BubbleSortState();
}

class _BubbleSortState extends State<BubbleSort> {
  late List<int> array;
  late BubbleSortCubit cubit;

  @override
  void initState() {
    generateArray();
    final array = List.generate(20, (index) => index + 1);
    cubit = BubbleSortCubit(array: array);
    super.initState();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  void generateArray() {
    array = List.generate(100, (index) => Random().nextInt(100));
    array = array.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bubble Sort',
            style: TextStyle(color: context.theme.colorScheme.primary),
          ),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Selector<BubbleSortCubit, int>(
                      builder: (context, value, child) => AnimatedFlipCounter(
                        value: value,
                        prefix: 'Total iterations count: ',
                        curve: Curves.easeInOut,
                        textStyle: context.textTheme.headline6,
                      ),
                      selector: (context, state) => state.iterations,
                    ),
                    const SizedBox(height: 10),
                    Selector<BubbleSortCubit, String>(
                      builder: (context, value, child) => Text(value),
                      selector: (context, state) => state.status,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(child: ArrayWidget()),
              Selector<BubbleSortCubit, double>(
                builder: (context, value, child) => Slider(
                  value: value / 1000,
                  onChanged: Provider.of<BubbleSortCubit>(context, listen: false).setSpeed,
                ),
                selector: (context, state) => state.speed,
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: cubit.bubbleSort,
                    child: const Text('Sort Array'),
                  ),
                  // const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: cubit.shuffleArray,
                    child: const Text('Shuffle Array'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
