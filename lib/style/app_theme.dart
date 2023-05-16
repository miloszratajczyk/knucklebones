import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // Prevents initialization

  static const seedColor = Color(0xff2a2f4e);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: seedColor,
    textTheme: textTheme,
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: seedColor,
    textTheme: textTheme,
  );

  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Silkscreen-Bold',
      fontSize: 57,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Silkscreen-Bold',
      fontSize: 45,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Silkscreen-Bold',
      fontSize: 36,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Silkscreen-Bold',
      fontSize: 32,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Silkscreen-Bold',
      fontSize: 28,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Silkscreen-Bold',
      fontSize: 24,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 22,
      height: 1.05,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 11,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Silkscreen-Regular',
      fontSize: 12,
    ),
  );
}
