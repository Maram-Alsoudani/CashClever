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

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30.sp,
            right: 30.sp,
            top: 130.sp,
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage(AppImages.user),
                width: 100.w,
                height: 100.h,
              ),
              Text(AppStrings.signIn,
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
                    Padding(
                      padding: EdgeInsets.only(top: 20.sp),
                      child: PrimaryButton(
                        onClicked: (){
                          context.go(AppRoutes.mainScreen);                        },
                        label: Text(AppStrings.signIn),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.primary),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgotPass,
                          style: context.bodySmall,
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: 130.h,
                    ),
                    InkWell(
                      onTap: (){
                        context.go(AppRoutes.registerScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.doNotHaveAnAcc,
                              style: context.bodySmall),
                          Text(
                            AppStrings.signUp,
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
