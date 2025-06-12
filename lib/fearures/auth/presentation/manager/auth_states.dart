import 'package:CashClever/core/errors/failures.dart';

abstract class AuthStates{}
class AuthInitialState extends AuthStates{}
class AuthLoadingState extends AuthStates{}
class AuthSuccessState extends AuthStates{}
class AuthErrorState extends AuthStates{
  Failure failure;
  AuthErrorState({required this.failure});
}
