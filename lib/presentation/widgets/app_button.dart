import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.name,
    this.callback,
    required this.backgroundColor,
    required this.textColor,
    this.textStyle,
  });

  final String name;
  final VoidCallback? callback;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: backgroundColor,
      onPressed: callback,
      child: Text(
        name,
        style: textStyle ?? Theme.of(context).textTheme.displayMedium!.copyWith(color: textColor),
      ),
    );
  }
}
