import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';

import 'color_schemes.dart';

class AppTheme {
  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        toolbarHeight: 90,
        backgroundColor: colorScheme.primary,
        titleTextStyle: Fonts.titleLarge.apply(color: colorScheme.onPrimary),
        iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 50),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.primary,
        selectedItemColor: colorScheme.onPrimary,
        selectedLabelStyle: Fonts.bodyMedium,
        unselectedLabelStyle: Fonts.bodyMedium,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outline
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: Fonts.bodyMedium
      )
    );
  }

  static final ThemeData lightTheme = themeData(lightColorScheme);
}
