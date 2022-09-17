import 'package:algorithm_visualizers/providers/sort_provider.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'widgets/array.dart';

class SortScreen<T> extends StatefulWidget {
  final String title;
  final SortProvider<T> sortProvider;

  const SortScreen({Key? key, required this.title, required this.sortProvider}) : super(key: key);

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState<T> extends State<SortScreen> {
  late List<int> array;
  // late SortProvider<T> cubit;

  @override
  void initState() {
    // cubit = SortProvider<T>();
    super.initState();
  }

  @override
  void dispose() {
    // cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.sortProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
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
              // const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Selector<SortProvider, int>(
                      builder: (context, value, child) => AnimatedFlipCounter(
                        value: value,
                        prefix: 'Total iterations count: ',
                        curve: Curves.easeInOut,
                        textStyle: context.textTheme.headline6,
                      ),
                      selector: (context, state) => state.iterations,
                    ),
                    const SizedBox(height: 10),
                    Selector<SortProvider, String>(
                      builder: (context, value, child) => Text(value),
                      selector: (context, state) => state.status,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(child: ArrayWidget()),
              Selector<SortProvider, double>(
                builder: (context, value, child) => Column(
                  children: [
                    Text('Animation speed: ${value.toStringAsFixed(0)} ms'),
                    Slider(
                      value: value / 1000,
                      onChanged: Provider.of<SortProvider>(context, listen: false).setSpeed,
                    ),
                  ],
                ),
                selector: (context, state) => state.speed,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: widget.sortProvider.sortMethod,
                    child: const Text('Sort Array'),
                  ),
                  // const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: widget.sortProvider.shuffleArray,
                    child: const Text('Shuffle Array'),
                  ),

                  ElevatedButton(
                    onPressed: widget.sortProvider.reverseArray,
                    child: const Text('Reverse Array'),
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
