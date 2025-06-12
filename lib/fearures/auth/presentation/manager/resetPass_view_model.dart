import 'package:CashClever/fearures/auth/domain/use_cases/forgot_pass_use_case.dart';
import 'package:CashClever/fearures/auth/presentation/manager/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ResetPassViewModel extends Cubit<AuthStates>{
  ForgotPassUseCase forgotPassUseCase;
  ResetPassViewModel({required this.forgotPassUseCase}):super(AuthInitialState());

  TextEditingController emailController= TextEditingController();

  resetPassword()async{
    emit(AuthLoadingState());
    var either= await forgotPassUseCase.call(emailController.text.trim());
    either.fold((error) {
      emit(AuthErrorState(failure: error));
    }, (success) {
      emit(AuthSuccessState());
    });
  }


}