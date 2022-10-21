import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/font_manager.dart';
import 'colors.dart';
import 'text_style.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    fontFamily: 'cairo',
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: getRegularStyle(
        color: AppColors.white,
        fontSize: FontSize.s30,
      ),
      backgroundColor: AppColors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
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
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.blue),
      ),
    ),
    textTheme: TextTheme(
      titleMedium: getRegularStyle(
        color: AppColors.white,
        fontSize: FontSize.s20,
      ),
      headlineLarge: getRegularStyle(
        color: AppColors.black,
        fontSize: FontSize.s30,
      ),
      displayMedium: getRegularStyle(
        color: AppColors.black,
        fontSize: FontSize.s20,
      ),
      displaySmall: getRegularStyle(
        color: AppColors.black,
        fontSize: FontSize.s16,
      ),
      labelSmall: getRegularStyle(
        color: AppColors.blue,
        fontSize: FontSize.s15,
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
