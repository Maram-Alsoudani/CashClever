import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../core/utils/colors.dart';

class PercentBarWidget extends StatelessWidget {
  String amount, category;
  double percent;
   PercentBarWidget({super.key, required this.amount, required this.category, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.yellow,
              radius: 8.r,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8.0.sp),
              child: Text(category, style: context.bodySmall),
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(right: 8.0.sp),
              child: Text(amount, style: context.bodyLarge,),
            )
          ],),
        LinearPercentIndicator(
          padding: EdgeInsets.symmetric(horizontal: 0.sp),
          backgroundColor: AppColors.lightGray,
          width: 325.w,
          lineHeight: 12.h,
          barRadius: Radius.circular(20.r),
          percent: percent,
          progressColor: AppColors.yellow,
          animation: true,
          animationDuration: 500,
        ),
      ],
    );
  }
}
