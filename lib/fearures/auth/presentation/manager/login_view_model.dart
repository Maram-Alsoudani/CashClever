import 'package:CashClever/fearures/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/login_use_case.dart';
import 'auth_states.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase})
      : super(AuthInitialState());

  //1- hold data
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  var formKey = GlobalKey<FormState>();

  // 2-handle logic
  Future<void> login() async {
    if(formKey.currentState!.validate()){
      emit(AuthLoadingState());
      var either = await loginUseCase.call(
       emailController.text, passwordController.text);
      either.fold((error) {
        emit(AuthErrorState(failure: error));
      }, (success) {
        emit(AuthSuccessState());
      });
    }

  }

}
