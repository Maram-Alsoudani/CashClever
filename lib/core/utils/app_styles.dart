import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

//  text styles
class AppTextStyles {
  static TextStyle topHeading = TextStyle(
    fontSize: 26.sp,
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.normal,
    color: AppColors.red,
  );
  static TextStyle heading = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle subheading = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle bodyText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,

  );

  static TextStyle lightBodyText = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.medGray,
  );

  static TextStyle smallText = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,

  );
}



