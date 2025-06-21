import 'package:CashClever/fearures/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_states.dart';

@injectable
class RegisterCubit extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase})
      : super(AuthInitialState());

  //1- hold data
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();

  // 2-handle logic
  Future<void> register() async {
    if(formKey.currentState!.validate()){
      emit(AuthLoadingState());
      var either = await registerUseCase.call(
          userNameController.text, emailController.text, passwordController.text);
      either.fold((error) {
        emit(AuthErrorState(failure: error));
      }, (success) {
        emit(AuthSuccessState());
      });
    }

  }
}
