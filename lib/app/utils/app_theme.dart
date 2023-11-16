import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get main => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(
            0xff866475,
          ),
          elevation: 0,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xff866475),
        ),
      );
}
