import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  Widget label;
  WidgetStateProperty<Color?>? backgroundColor;
  void Function()? onClicked;

  PrimaryButton({super.key, required this.label, this.backgroundColor, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding:
              WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 13.sp)),
          backgroundColor:
              backgroundColor ?? WidgetStatePropertyAll(AppColors.babyPink),
          foregroundColor: WidgetStatePropertyAll(AppColors.white),
          textStyle: WidgetStatePropertyAll(context.bodyMedium.copyWith(color: AppColors.white, fontSize: 20)),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r))),
        ),
        onPressed: onClicked,
        child: label);
  }
}
