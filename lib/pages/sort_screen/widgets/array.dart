import 'package:algorithm_visualizers/providers/sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'element.dart';

class ArrayWidget extends StatefulWidget {
  const ArrayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ArrayWidget> createState() => _ArrayWidgetState();
}

class _ArrayWidgetState extends State<ArrayWidget> {
  final Size _childSize = const Size.square(60);
  double width = 320;
  final dividerKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.maxWidth;
      return Consumer<SortProvider>(
        builder: (context, state, Widget? child) {
          return Stack(
            children: children(state),
          );
        },
      );
    });
  }

  Widget child(int index, int element, SortProvider state) {
    final position = _getPosition(index);
    return AnimatedPositioned(
      key: ValueKey(element),
      duration: 300.milliseconds,
      curve: Curves.ease,
      left: position.dx,
      top: position.dy,
      child: ElementWidget(
        currentCheckingItem: index == state.nextIndex,
        isSelected: index == state.selectedIndex,
        duration: state.speed.milliseconds,
        size: _childSize,
        data: element == -1 ? '' : element.toString(),
      ),
    );
  }

  List<Widget> children(SortProvider provider) {
    final list = <Widget>[];
    for (var i = 0; i < provider.array.length; i++) {
      final element = provider.array.elementAt(i);

      list.add(child(i, element, provider));
    }

    return list;
  }

  // Widget _divider(int index) {
  //   final position = _getPosition(index, elementWidth: 60);
  //   return AnimatedPositioned(
  //     key: dividerKey,
  //     duration: 300.milliseconds,
  //     curve: Curves.ease,
  //     left: position.dx + 10,
  //     top: position.dy,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 10),
  //       child: Container(
  //         margin: const EdgeInsets.only(right: 10),
  //         height: 60,
  //         width: 5,
  //         decoration: BoxDecoration(
  //           color: Colors.black87,
  //           borderRadius: BorderRadius.circular(25),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Offset _getPosition(int index, {double? elementWidth}) {
    final screenWidth = width;
    final widgetSize = elementWidth ?? _childSize.height + 10;
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
