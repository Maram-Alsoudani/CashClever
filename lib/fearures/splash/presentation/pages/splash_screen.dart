import 'package:finsage/core/utils/app_styles.dart';
import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/images.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      //TODO : Navigation to another screen.
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage(AppImages.splashPrint),
            width: 180.w,
            height: 200.h,
          ),
          Text(AppStrings.appName,
            textAlign: TextAlign.center,
            style: AppTextStyles.topHeading.copyWith(color: AppColors.black),)

        ],
      ),
    );
  }
}
