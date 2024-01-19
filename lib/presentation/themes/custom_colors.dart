import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    this.background,
    this.grey,
    this.blue,
    this.green,
    this.red,
  });

  final Color? background;
  final Color? grey;
  final Color? blue;
  final Color? green;
  final Color? red;

  @override
  CustomColors copyWith({
    Color? background,
    Color? grey,
    Color? blue,
    Color? green,
    Color? red,
  }) {
    return CustomColors(
      background: background ?? this.background,
      grey: grey ?? this.grey,
      blue: blue ?? this.blue,
      green: green ?? this.green,
      red: red ?? this.red,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      background: Color.lerp(background, other.background, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      green: Color.lerp(green, other.green, t)!,
      red: Color.lerp(red, other.red, t)!,
    );
  }

  static const light = CustomColors(
    background: Color(0xFFFEFEFE),
    grey: Color(0xFF323232),
    blue: Color(0xFF223752),
    green: Color(0xFF60DC26),
    red: Color(0xFFD40606),
  );
}
