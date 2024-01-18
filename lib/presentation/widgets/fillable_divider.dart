import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FillableDivider extends StatelessWidget {
  final int fillPercentage;
  final double width;
  final Color color;
  final Color filledColor;

  const FillableDivider({
    super.key,
    required this.fillPercentage,
    required this.width,
    required this.color,
    required this.filledColor,
  });

  @override
  Widget build(BuildContext context) {
    assert(fillPercentage >= 0 && fillPercentage <= 100);

    return Container(
      height: 1.0,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            filledColor,
            color,
          ],
          stops: [fillPercentage / 100, fillPercentage / 100],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
