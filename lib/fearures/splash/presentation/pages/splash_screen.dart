import 'package:finsage/config/routes.dart';
import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward().then((_) {
      Timer(const Duration(milliseconds: 1500), () {
        context.go(AppRoutes.loginScreen);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: Lottie.asset("assets/lottie/splash.json"),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              textAlign: TextAlign.center,
              AppStrings.appName,
              style: context.headlineLarge.copyWith(color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}
