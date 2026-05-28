import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {

  final bool isActive;

  const PageIndicator({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration:
          const Duration(milliseconds: 300),

      margin:
          const EdgeInsets.symmetric(
        horizontal: 4,
      ),

      width: isActive ? 18 : 8,
      height: 8,

      decoration: BoxDecoration(
        color: isActive
            ? Colors.black
            : Colors.black26,

        borderRadius:
            BorderRadius.circular(10),
      ),
    );
  }
}