import 'package:finsage/core/utils/app_styles.dart';
import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",style: AppTextStyles.topHeading.copyWith(fontFamily: "Maven Pro"),)
          ],
        ),
      )
    );
  }
}
