import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> labels;
  final Color? indicatorColor;
  final Function(int)? onTap;


  const CustomTabBar({super.key, required this.labels, this.indicatorColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      dividerColor: Colors.transparent,
      labelPadding: EdgeInsets.all(0.sp),
      labelStyle: context.bodySmall.copyWith(color: AppColors.black),
      labelColor: AppColors.white,
      indicator: BoxDecoration(
        color: indicatorColor ?? AppColors.lightBlue,
        borderRadius: BorderRadius.circular(30.r),
      ),
      tabs: labels.map((label) {
        return Center(child: Tab(text: label));
      }).toList(),
    );
  }


}
