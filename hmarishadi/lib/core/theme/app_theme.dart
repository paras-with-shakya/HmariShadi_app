import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkBg,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBg,
      foregroundColor: Colors.white,
    ),
  );
}
// This class defines two static ThemeData objects, lightTheme and darkTheme, which can be used throughout the app to maintain a consistent look and feel. You can customize the themes further by adding more properties like textTheme, buttonTheme, etc.
//example usage in main.dart:
// theme: AppTheme.lightTheme,
// darkTheme: AppTheme.darkTheme,
// This way, you can easily switch between light and dark themes in your app by using the toggleTheme function in your MyApp widget.
// You can also extend the AppTheme class to include more themes or variations if needed in the future.