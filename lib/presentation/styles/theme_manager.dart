import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/font_manager.dart';
import 'colors.dart';
import 'text_style.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
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
      titleLarge: getBoldStyle(
        color: AppColors.white,
        fontSize: FontSize.s24,
      ),
      titleMedium: getRegularStyle(
        color: AppColors.white,
        fontSize: FontSize.s20,
      ),
      titleSmall: getRegularStyle(
        color: AppColors.black,
      ),
      headlineLarge: getRegularStyle(
        color: AppColors.black,
        fontSize: FontSize.s30,
      ),
      headlineSmall: getRegularStyle(
        color: AppColors.white,
        fontSize: FontSize.s15,
      ),
      bodySmall: getRegularStyle(
        color: AppColors.grey,
        fontSize: FontSize.s16,
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
      suffixIconColor: AppColors.grey,
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white.withAlpha(0),
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.grey,
    ),
  );
}
