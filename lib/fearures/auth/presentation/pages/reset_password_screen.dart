import 'package:CashClever/core/utils/dialog_utils.dart';
import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/fearures/auth/presentation/manager/auth_states.dart';
import 'package:CashClever/fearures/auth/presentation/manager/resetPass_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/components/validators.dart';
import '../../../../core/dependency_injection.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/strings.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({super.key});

  TextEditingController emailController = TextEditingController();
  ResetPassViewModel viewModel= getIt<ResetPassViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPassViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state){
        if(state is AuthErrorState){
          return DialogUtils.showMessage(
              context: context,
              message: state.failure.errorMessage,
            title: "failed",
            posActionName: "Close"
          );
        }else if(state is AuthSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Password reset email sent.'))
          );
          context.go(AppRoutes.loginScreen);
        }
      },
      builder: (context, state){
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
                        child: Image.asset(
                          AppImages.logo,
                          width: 64.w,
                          height: 64.h,
                        ),
                      ),
                      Text(
                        AppStrings.appName,
                        style: context.headlineLarge.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text("Reset Password",
                      style: context.headlineMedium.copyWith(
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
                          AppStrings.email,
                          style: context.bodyLarge.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        CustomTextFormField(
                            enabledBorderColor: AppColors.lightGray,
                            focusedBorderColor: AppColors.primary,
                            hint: AppStrings.enterYorEmail,
                            validator: (val) => AppValidators.validateEmail(val),
                            controller: viewModel.emailController),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "* We will send you a message to set or reset your new password",
                          style: context.bodyLarge.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 56.sp, bottom: 10.sp),
                          child: PrimaryButton(
                            onClicked: () {
                              viewModel.resetPassword();
                            },
                            label:state is AuthLoadingState?
                              CircularProgressIndicator(color: AppColors.white,):
                              Text("SEND MAIL"),
                            backgroundColor:
                            WidgetStatePropertyAll(AppColors.primary),
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
      },

    );
  }

  void login() {}
}
