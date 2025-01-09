import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/components/validators.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/strings.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30.sp,
            right: 30.sp,
            top: 90.sp,
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage(AppImages.user),
                width: 100.w,
                height: 100.h,
              ),
              Text(AppStrings.signUp,
                  style: context.headlineLarge
                      .copyWith(fontWeight: FontWeight.w400)),
              Divider(
                color: AppColors.medGray,
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppStrings.userName,
                      style: context.bodyLarge,
                    ),
                    CustomTextFormField(
                        enabledBorderColor: AppColors.darkGray,
                        hint: AppStrings.enterYourName,
                        validator: (val) => AppValidators.validateUsername(val),
                        controller: userNameController),
                    Text(
                      AppStrings.email,
                      style: context.bodyLarge,
                    ),
                    CustomTextFormField(
                        enabledBorderColor: AppColors.darkGray,
                        hint: AppStrings.enterYorEmail,
                        validator: (val) => AppValidators.validateEmail(val),
                        controller: emailController),
                    Text(
                      AppStrings.password,
                      style: context.bodyLarge,
                    ),
                    CustomTextFormField(
                        isSecured: true,
                        enabledBorderColor: AppColors.darkGray,
                        hint: AppStrings.enterYorPass,
                        validator: (val) => AppValidators.validatePassword(val),
                        controller: passwordController),
                    Text(
                      AppStrings.confirmPass,
                      style: context.bodyLarge,
                    ),
                    CustomTextFormField(
                        isSecured: true,
                        enabledBorderColor: AppColors.darkGray,
                        hint: AppStrings.confirmPass,
                        validator: (val) => AppValidators.validateConfirmPassword(val, passwordController.text),
                        controller: confirmPasswordController),
                    Padding(
                      padding: EdgeInsets.only(top: 20.sp),
                      child: PrimaryButton(
                        label: Text(AppStrings.signUp),
                        backgroundColor:
                        WidgetStatePropertyAll(AppColors.primary),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    InkWell(
                      onTap: (){
                        context.go(AppRoutes.loginScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.alreadyHaveAnAcc,
                              style: context.bodySmall),
                          Text(
                            AppStrings.signIn,
                            style: context.bodySmall
                                .copyWith(decoration: TextDecoration.underline),
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
