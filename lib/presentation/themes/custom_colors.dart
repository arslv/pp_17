import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    this.background,
    this.grey,
    this.blue,
  });

  final Color? background;
  final Color? grey;
  final Color? blue;

  @override
  CustomColors copyWith({
    Color? background,
    Color? grey,
    Color? blue,
  }) {
    return CustomColors(
      background: background ?? this.background,
      grey: grey ?? this.grey,
      blue: blue ?? this.blue,
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
    );
  }

  static const light = CustomColors(
    background: Color(0xFFFEFEFE),
    grey: Color(0xFF323232),
    blue: Color(0xFF223752),
  );
}
