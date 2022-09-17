import 'package:algorithm_visualizers/pages/n_queens/models/queen_model.dart';
import 'package:algorithm_visualizers/pages/n_queens/n_queens_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NQueensScreen extends StatefulWidget {
  const NQueensScreen({Key? key}) : super(key: key);

  @override
  State<NQueensScreen> createState() => _NQueensScreenState();
}

class _NQueensScreenState extends State<NQueensScreen> {
  double childSize = 60;
  double width = 100;
  late NQueensProvider provider;

  @override
  void initState() {
    provider = NQueensProvider();
    super.initState();
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('N Queens Problem'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          childSize = MediaQuery.of(context).size.width / provider.size;
          width = constraints.maxWidth;

          return Consumer<NQueensProvider>(
            builder: (context, state, _) {
              return Stack(
                children: [
                  for (var i = 0; i < state.board.length; i++) children(i, state.board.elementAt(i))
                ],
              );
            },
          );
        }),
      ),
    );
  }

  Widget children(int i, List<QueenModel> rows) {
    final row = List.generate(
      rows.length,
      (index) => child(index, rows[index]),
    ).toList();
    return Positioned(
      top: childSize * (i + 1),
      child: Row(
        children: row,
      ),
    );
  }

  Widget child(int index, QueenModel value) {
    final position = _getPosition(index);
    return AnimatedPositioned(
      duration: 300.milliseconds,
      key: value.key,
      top: position.dy,
      left: position.dx,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        height: childSize,
        width: childSize,
        child: value.data == "" ? const Text("") : Image.asset('assets/queen.png'),
      ),
    );
  }

  Offset _getPosition(int index, {double? elementWidth}) {
    final screenWidth = width;
    final widgetSize = elementWidth ?? childSize;
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
