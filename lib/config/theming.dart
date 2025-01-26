import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: AppColors.white,
    textTheme:  TextTheme(
      headlineLarge: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold, color: AppColors.darkGray, fontFamily: "Cairo"),
      headlineMedium: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600, color: AppColors.darkGray,fontFamily: "Cairo"),
      bodyLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.normal, color: AppColors.darkGray,fontFamily: "Cairo"),
      bodyMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppColors.darkGray,fontFamily: "Cairo"),
      bodySmall: TextStyle(
          fontSize: 14.sp, fontWeight: FontWeight.w800, color: AppColors.medGray,fontFamily: "Cairo"),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      height: 83.h,
        color: AppColors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r)
      ),
      backgroundColor: AppColors.lightBlue,
    )
  );

}
