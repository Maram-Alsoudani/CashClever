import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';

class TransactionsItem extends StatelessWidget {
  final String type;
  final String amount;
  const TransactionsItem({super.key, required this.amount, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 10.sp),
      margin: EdgeInsets.all(10.sp),
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
        color: Color(0x80FFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5.r,
            blurRadius: 7.r,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(children: [
        Container(
          width: 30.w,
          height: 30.h,
          margin: EdgeInsets.only(right: 10.sp),
          decoration: BoxDecoration(
              color: type=='income'?AppColors.green : AppColors.lightRedColor,
              borderRadius: BorderRadius.circular(25.r)
          ),
          child: Icon(
            type=='income'?
            Icons.arrow_upward : Icons.arrow_downward
            , color: AppColors.white,),
        ),
        Text("$amount EGP", style: context.bodyLarge.copyWith(
          color: type=='income'?AppColors.black : AppColors.lightRedColor,
        ),),
        Spacer(),
        Text(type, style: context.bodyMedium.copyWith(color: AppColors.medGray),)
      ],),
    );
  }
}
