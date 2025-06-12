import 'package:dartz/dartz.dart';
import 'package:CashClever/fearures/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
@injectable
class RegisterUseCase {
  AuthRepo registerRepo;

  RegisterUseCase({required this.registerRepo});

  Future<Either<Failure, void>> call(
      String username, String email, String password) async {
    return registerRepo.register(username, email, password);
  }
}
