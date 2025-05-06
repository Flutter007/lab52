import 'package:flutter/material.dart';

import 'color.dart';

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.red,
  brightness: Brightness.dark,
);

final darkCustomColor = CustomColor(
  bottomNavBarSelectedColor: Colors.white,
  cardBackgroundColor: Colors.grey.shade200,
  redShade: Colors.red.shade900,
  txtColor: Colors.black,
);
final darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  extensions: [darkCustomColor],
  appBarTheme: AppBarTheme(backgroundColor: darkColorScheme.primaryContainer),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkColorScheme.primary,
    selectedItemColor: darkCustomColor.bottomNavBarSelectedColor,
    unselectedItemColor: darkColorScheme.onPrimary,
    selectedIconTheme: IconThemeData(color: darkCustomColor.redShade),
  ),
  iconTheme: IconThemeData(color: darkCustomColor.redShade),
  cardTheme: CardTheme(color: darkCustomColor.cardBackgroundColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.inverseSurface,
      foregroundColor: darkColorScheme.onInverseSurface,
      iconColor: darkColorScheme.surface,
    ),
  ),
);
