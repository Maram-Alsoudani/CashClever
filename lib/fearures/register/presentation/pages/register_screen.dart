import 'package:finsage/config/routes.dart';
import 'package:finsage/core/components/custom_text_form_field.dart';
import 'package:finsage/core/components/primary_button.dart';
import 'package:finsage/core/components/validators.dart';
import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/core/utils/images.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.sp,
            right: 16.sp,
            top: 82.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(AppImages.logo, width: 64.w, height: 64.h,),
                  ),
                  Text(AppStrings.appName,
                    style: context.headlineLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,

                    ),)
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(AppStrings.signUp,
                  style: context.headlineMedium
                      .copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary)),
              SizedBox(
                height: 24.h,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppStrings.userName,
                      style: context.bodyLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    CustomTextFormField(
                        enabledBorderColor: AppColors.lightGray,
                        focusedBorderColor: AppColors.primary,
                        hint: AppStrings.enterYourName,
                        validator: (val) => AppValidators.validateUsername(val),
                        controller: emailController),
                    SizedBox(height: 20,),
                    Text(
                      AppStrings.email,
                      style: context.bodyLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    CustomTextFormField(
                        enabledBorderColor: AppColors.lightGray,
                        focusedBorderColor: AppColors.primary,
                        hint: AppStrings.enterYorEmail,
                        validator: (val) => AppValidators.validateEmail(val),
                        controller: emailController),
                    SizedBox(height: 20,),
                    Text(
                      AppStrings.password,
                      style: context.bodyLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    CustomTextFormField(
                        isSecured: true,
                        enabledBorderColor: AppColors.lightGray,
                        focusedBorderColor: AppColors.primary,
                        hint: AppStrings.enterYorPass,
                        validator: (val) => AppValidators.validatePassword(val),
                        controller: passwordController),
                    SizedBox(height: 20,),
                    Text(
                      AppStrings.confirmPass,
                      style: context.bodyLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    CustomTextFormField(
                        isSecured: true,
                        enabledBorderColor: AppColors.lightGray,
                        focusedBorderColor: AppColors.primary,
                        hint: AppStrings.enterYorEmail,
                        validator: (val) => AppValidators.validateConfirmPassword(val, passwordController.text),
                        controller: emailController),

                    Padding(
                      padding: EdgeInsets.only(top: 25.sp, bottom: 10.sp),
                      child: PrimaryButton(
                        onClicked: (){
                          context.go(AppRoutes.mainScreen);                        },
                        label: Text(AppStrings.signUp),
                        backgroundColor:
                        WidgetStatePropertyAll(AppColors.primary),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        context.go(AppRoutes.loginScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.alreadyHaveAnAcc,
                            style:  context.bodySmall.copyWith(
                                color: AppColors.primary, fontWeight: FontWeight.w400
                            ),),
                          Text(
                            AppStrings.signIn,
                            style:  context.bodySmall.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.orange,
                                color: AppColors.orange, fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
