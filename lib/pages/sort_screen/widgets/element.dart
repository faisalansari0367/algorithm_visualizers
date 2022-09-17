import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElementWidget extends StatelessWidget {
  final bool isSelected;
  final bool currentCheckingItem;
  final String data;
  final Size size;
  final Duration duration;
  const ElementWidget({
    Key? key,
    required this.data,
    this.size = const Size(50, 50),
    this.isSelected = false,
    this.duration = const Duration(milliseconds: 300),
    this.currentCheckingItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor =
        isSelected ? context.theme.colorScheme.primary : const Color.fromARGB(255, 255, 255, 255);
    final selectedTextColor =
        isSelected || currentCheckingItem ? Colors.white : Colors.grey.shade900;
    final selectedSize = size.height;
    return AnimatedContainer(
      duration: duration,
      // padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      height: selectedSize,
      width: selectedSize,
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        // shape: !isSelected || !currentCheckingItem ? BoxShape.rectangle : BoxShape.circle,
        shape: BoxShape.circle,
        color: currentCheckingItem ? context.theme.colorScheme.secondary : selectedColor,
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(5, 0),
          ),
          BoxShadow(
            color: context.theme.colorScheme.primary.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(5, -5),
          ),
        ],
      ),
      child: Text(
        data,
        style: TextStyle(color: selectedTextColor),
      ),
    );
  }
}
