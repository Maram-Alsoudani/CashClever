import 'package:dartz/dartz.dart';
import 'package:finsage/fearures/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
@injectable
class LoginUseCase{
  AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Either<Failure, void>>  call(String email, String password)async{
    return authRepo.login(email, password);
  }
}