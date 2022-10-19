import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/font_manager.dart';
import 'colors.dart';
import 'text_style.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    fontFamily: 'cairo',
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.white,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: getRegularStyle(
        color: AppColors.black,
        fontSize: FontSize.s30,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getRegularStyle(color: AppColors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
