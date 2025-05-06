import 'package:flutter/material.dart';

class CustomColor extends ThemeExtension<CustomColor> {
  final Color bottomNavBarSelectedColor;
  final Color cardBackgroundColor;
  final Color redShade;
  final Color txtColor;

  CustomColor({
    required this.bottomNavBarSelectedColor,
    required this.cardBackgroundColor,
    required this.redShade,
    required this.txtColor,
  });

  @override
  ThemeExtension<CustomColor> copyWith({
    Color? bottomNavBarSelectedColor,
    Color? appBarColor,
    Color? cardBackgroundColor,
    Color? redShade,
    Color? txtColor,
  }) {
    return CustomColor(
      bottomNavBarSelectedColor:
          bottomNavBarSelectedColor ?? this.bottomNavBarSelectedColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,

      redShade: redShade ?? this.redShade,
      txtColor: txtColor ?? this.txtColor,
    );
  }

  @override
  ThemeExtension<CustomColor> lerp(
    covariant ThemeExtension<CustomColor>? other,
    double t,
  ) {
    if (other is! CustomColor) return this;
    return CustomColor(
      bottomNavBarSelectedColor:
          Color.lerp(
            bottomNavBarSelectedColor,
            other.bottomNavBarSelectedColor,
            t,
          )!,
      txtColor: Color.lerp(txtColor, other.txtColor, t)!,
      cardBackgroundColor:
          Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
      redShade: Color.lerp(redShade, other.redShade, t)!,
    );
  }
}
