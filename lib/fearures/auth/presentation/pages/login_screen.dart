import 'package:CashClever/config/routes.dart';
import 'package:CashClever/core/components/custom_text_form_field.dart';
import 'package:CashClever/core/components/primary_button.dart';
import 'package:CashClever/core/components/validators.dart';
import 'package:CashClever/core/dependency_injection.dart';
import 'package:CashClever/core/utils/colors.dart';
import 'package:CashClever/core/utils/dialog_utils.dart';
import 'package:CashClever/core/utils/extentions/text_styles.dart';
import 'package:CashClever/core/utils/images.dart';
import 'package:CashClever/core/utils/strings.dart';
import 'package:CashClever/fearures/auth/presentation/manager/auth_states.dart';
import 'package:CashClever/fearures/auth/presentation/manager/login_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

LoginViewModel viewModel= getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel, AuthStates>(
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
          context.go(AppRoutes.mainScreen);
        }
      },
      builder: (context, state){

        return  Scaffold(
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
                  Text(AppStrings.signIn,
                      style: context.headlineMedium
                          .copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary)),
                  SizedBox(
                    height: 24.h,
                  ),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          AppStrings.email,
                          style: context.bodyLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        CustomTextFormField(
                            enabledBorderColor: AppColors.lightGray,
                            focusedBorderColor: AppColors.primary,
                            hint: AppStrings.enterYorEmail,
                            validator: (val) => AppValidators.validateEmail(val),
                            controller: viewModel.emailController),
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
                            validator: (val) => AppValidators.validateLoginPassword(val),
                            controller: viewModel.passwordController),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                context.go(AppRoutes.resetPassScreen);
                              },
                              child: Text(
                                AppStrings.forgotPass,
                                style: context.bodySmall.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.orange,
                                    color: AppColors.orange, fontWeight: FontWeight.w400
                                ),
                              )),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 56.sp, bottom: 10.sp),
                          child: PrimaryButton(
                            onClicked: (){
                              viewModel.login();},
                            label:state is AuthLoadingState?
                            CircularProgressIndicator(): Text(AppStrings.signIn),
                            backgroundColor:
                            WidgetStatePropertyAll(AppColors.primary),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            context.go(AppRoutes.registerScreen);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.doNotHaveAnAcc,
                                style:  context.bodySmall.copyWith(
                                    color: AppColors.primary, fontWeight: FontWeight.w400
                                ),),
                              Text(
                                AppStrings.signUp,
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
      },

    );
  }
//if email not found -> invalid credential

  // Future<void> login() async{
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text,
  //         password: passwordController.text
  //     );
  //   }on FirebaseAuthException catch (e) {
  //     if (e.code == "invalid-credential") {
  //       print("wrong pass");
  //     } else {
  //       print(e.message);
  //     }
  //   } catch (e) {
  //    print(e.toString());
  //   }
  // }
}
