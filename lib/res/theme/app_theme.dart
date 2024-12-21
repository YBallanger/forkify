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
            titleTextStyle:
                Fonts.titleLarge.apply(color: colorScheme.onPrimary),
            iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 50)));
  }

  static final ThemeData lightTheme = themeData(lightColorScheme);
}
