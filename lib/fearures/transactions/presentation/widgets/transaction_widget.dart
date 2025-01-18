import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';

class TransactionWidget extends StatelessWidget {
  final String category, description, amount, date;
  const TransactionWidget({super.key, required this.amount, required this.category, required this.date, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20),
      margin: EdgeInsets.all(10.sp),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGray,
            spreadRadius: 5.r,
            blurRadius: 7.r,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category, style: context.bodyMedium,),
              Text(description, style: context.bodySmall,),
            ],),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(amount, style: context.bodyMedium,),
              Text(date, style: context.bodySmall,),
            ],)
        ],),
    );
  }
}
