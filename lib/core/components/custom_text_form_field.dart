import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final bool? isSecured;
  final bool? filled;
  final Color? filledColor;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final bool enable;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isSecured = false,
    this.suffixIcon,
    this.borderRadius,
    this.enable = true,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.onChanged,
    this.filled,
    this.filledColor
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isSecured;

  @override
  void initState() {
    super.initState();
    _isSecured = widget.isSecured ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.sp),
      child: TextFormField(
        enabled: widget.enable,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        obscureText: _isSecured,
        cursorColor: AppColors.primary,
        style: context.bodyMedium,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: widget.filled?? false,
          fillColor: widget.filledColor,
          hintText: widget.hint,
          hintStyle:context.bodyMedium.copyWith(color: AppColors.medGray, fontSize: 16),
          suffixIcon: widget.isSecured == true
              ? IconButton(
            onPressed: () {
              setState(() {
                _isSecured = !_isSecured;
              });
            },
            icon: Icon(
              _isSecured ? Icons.visibility_off : Icons.visibility,
              color: AppColors.primary,
            ),
          )
              : widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4.r),
            borderSide: BorderSide(
              width: 0.7,
              color: widget.enabledBorderColor ?? AppColors.white,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
            borderSide: BorderSide(
              width: 1,
              color: widget.disabledBorderColor ?? AppColors.medGray,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4.r),
            borderSide: BorderSide(
              width: 1.5.w,
              color: widget.focusedBorderColor ?? AppColors.darkGray,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
            borderSide: BorderSide(
              width: 1.5.w,
              color: widget.errorBorderColor ?? AppColors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
            borderSide: BorderSide(
              width: 1.5.w,
              color: widget.errorBorderColor ?? AppColors.red,
            ),
          ),
        ),
      ),
    );
  }
}