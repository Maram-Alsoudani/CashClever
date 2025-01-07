import 'package:finsage/config/routes.dart';
import 'package:finsage/core/utils/app_styles.dart';
import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/images.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10),(){
      if(mounted){
        context.go(AppRoutes.loginScreen);
      }
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
            image: AssetImage(AppImages.splashLogo),
            width: 180.w,
            height: 200.h,
          ),

        ],
      ),
    );
  }
}
