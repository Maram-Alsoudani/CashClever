import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';

class SettingsItem extends StatelessWidget {
  final String imagePath;
  final String text;
  const SettingsItem({
     super.key,
     required this.imagePath,
     required this.text
   });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.sp),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGray,
            spreadRadius: 2.r,
            blurRadius: 9.r,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: ListTile(
        leading:Image(
              image: AssetImage(imagePath,),
              width: 60,
              height: 60,
              color: AppColors.black,
            ),
        title:Text(text, style: context.bodyMedium,),
        trailing:  Icon(Icons.arrow_forward_ios),

      ),

    );
  }
}

