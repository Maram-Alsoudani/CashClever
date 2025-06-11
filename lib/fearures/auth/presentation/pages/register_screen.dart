import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsage/config/routes.dart';
import 'package:finsage/core/components/custom_text_form_field.dart';
import 'package:finsage/core/components/primary_button.dart';
import 'package:finsage/core/components/validators.dart';
import 'package:finsage/core/utils/colors.dart';
import 'package:finsage/core/utils/dialog_utils.dart';
import 'package:finsage/core/utils/extentions/text_styles.dart';
import 'package:finsage/core/utils/images.dart';
import 'package:finsage/core/utils/strings.dart';
import 'package:finsage/fearures/auth/presentation/manager/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection.dart';
import '../manager/auth_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  RegisterViewModel viewModel= getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state){
        if(state is AuthErrorState){
          return DialogUtils.showMessage(
            title: "failed",
              context: context,
              message: state.failure.errorMessage,
            posActionName: "OK"
          );
        }else if(state is AuthSuccessState){
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
                   key: viewModel.formKey,
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
                           controller: viewModel.userNameController),
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
                           validator: (val) => AppValidators.validatePassword(val),
                           controller: viewModel.passwordController),
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
                           validator: (val) => AppValidators.validateConfirmPassword(val, viewModel.passwordController.text),
                           controller: viewModel.confirmPasswordController),

                       Padding(
                         padding: EdgeInsets.only(top: 25.sp, bottom: 10.sp),
                         child: PrimaryButton(
                           onClicked: state is AuthLoadingState ? null : viewModel.register,
                           label: state is AuthLoadingState
                               ? SizedBox(
                             width: 24,
                             height: 24,
                             child: CircularProgressIndicator(
                               strokeWidth: 2.5,
                               color: Colors.white,
                             ),
                           )
                               : Text(AppStrings.signUp),
                           backgroundColor: WidgetStatePropertyAll(AppColors.primary),
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
      },
    );
  }



  }

