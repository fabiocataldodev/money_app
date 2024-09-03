import 'package:flutter/material.dart';
import 'package:money_app/src/app_config/colors/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.secondaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey[200]!, width: 1.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        foregroundColor:
            WidgetStateProperty.all<Color>(const Color(0xFF333333)),
        elevation: WidgetStateProperty.all<double>(4),
      ),
    ),
  );
}
