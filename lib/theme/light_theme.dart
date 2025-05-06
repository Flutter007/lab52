import 'package:flutter/material.dart';
import 'package:lab52/theme/color.dart';

final lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.red);

final lightCustomColor = CustomColor(
  bottomNavBarSelectedColor: Colors.white,
  cardBackgroundColor: Colors.grey.shade100,
  redShade: Colors.red.shade400,
  txtColor: Colors.black,
);

final lightTheme = ThemeData.light().copyWith(
  colorScheme: lightColorScheme,
  extensions: [lightCustomColor],
  appBarTheme: AppBarTheme(backgroundColor: lightColorScheme.primaryContainer),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColorScheme.primary,
    selectedItemColor: lightCustomColor.bottomNavBarSelectedColor,
    unselectedItemColor: lightColorScheme.onPrimary,
    selectedIconTheme: IconThemeData(color: lightCustomColor.redShade),
  ),

  cardTheme: CardTheme(color: lightCustomColor.cardBackgroundColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.primaryContainer,
      foregroundColor: lightColorScheme.inverseSurface,
      iconColor: lightColorScheme.inverseSurface,
    ),
  ),
);
