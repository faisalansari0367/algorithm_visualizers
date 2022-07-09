// import 'package:algorithm_visualizers/sort_screen.dart/widgets/element.dart';
import 'package:algorithm_visualizers/sort_screen/cubit/bubble_sort_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// import 'package:equatable/equatable.dart';

import 'element.dart';

class ArrayWidget extends StatefulWidget {
  // final List<int> data;
  // final Size childSize;
  // final double padding;
  const ArrayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ArrayWidget> createState() => _ArrayWidgetState();
}

class _ArrayWidgetState extends State<ArrayWidget> {
  // final _stackKey = GlobalKey();
  final Size _childSize = const Size.square(60);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Consumer<BubbleSortCubit>(
        builder: (context, state, Widget? child) {
          // final state = provider.state;
          return Stack(
            children: state.array.map(
              (element) {
                final index = state.array.indexOf(element);
                final position = _getPosition(constraints.maxWidth, index);
                return AnimatedPositioned(
                  key: ValueKey(element),
                  duration: 300.milliseconds,
                  curve: Curves.ease,
                  left: position.dx,
                  top: position.dy,
                  child: ElementWidget(
                    currentCheckingItem: index == state.nextIndex,
                    isSelected: index == state.selectedIndex,
                    duration: 500.milliseconds,
                    size: _childSize,
                    data: element.toString(),
                  ),
                );
              },
            ).toList(),
          );
        },
      );
    });
  }

  Offset _getPosition(double width, int index) {
    final screenWidth = width;
    final widgetSize = _childSize.height + 10;
    final horizontalFit = screenWidth ~/ widgetSize;
    final totalWidgetsSize = horizontalFit * widgetSize;
    final leftOver = screenWidth - totalWidgetsSize;
    final verticalIndex = index ~/ horizontalFit;
    final horizontalIndex = index % horizontalFit;
    final x = (widgetSize * horizontalIndex) + leftOver / 2;
    final y = widgetSize * verticalIndex;
    return Offset(x, y);
  }
}
