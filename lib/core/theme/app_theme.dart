import 'package:cindy/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        shape:  Border(
          bottom: BorderSide(
            color: AppColors.primaryColor,
          ),
        ), 
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 238, 43, 123),
        primary: const Color.fromARGB(108, 238, 43, 124),
        secondary: const Color.fromARGB(255, 232, 232, 232),
        tertiary: const Color.fromARGB(155, 238, 43, 124),
        surface: const Color.fromARGB(255, 62, 62, 62),
      ),
      useMaterial3: true,
    );
  }
}
