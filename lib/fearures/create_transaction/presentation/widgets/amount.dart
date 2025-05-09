import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';

class Amount extends StatelessWidget {
  String amount;
  Function onClicked;
   Amount({super.key, required this.amount, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp, bottom: 10.sp),
      padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
      decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.medGray, width: 1)),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTap:()=> onClicked(),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.grey[200],
                  child: Text(amount),
                ),
              )
          ),
          SizedBox(
            height: 40.0, // Set the height of the divider
            child: VerticalDivider(
              color: AppColors.medGray, // Divider color
              thickness: 1.5, // Thickness of the divider
            ),
          ),
          Text("EGP"),
        ],
      ),
    );
  }
}
