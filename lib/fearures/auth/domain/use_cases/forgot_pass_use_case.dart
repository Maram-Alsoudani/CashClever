import 'package:dartz/dartz.dart';
import 'package:CashClever/fearures/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
@injectable
class ForgotPassUseCase{
  AuthRepo authRepo;
  ForgotPassUseCase({
    required this.authRepo
});
  Future<Either<Failure, void>>call(String email){
    return authRepo.resetPassword(email);
  }
}