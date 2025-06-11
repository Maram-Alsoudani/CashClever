import 'package:dartz/dartz.dart';
import 'package:finsage/core/errors/failures.dart';
import 'package:finsage/fearures/auth/data/data_sources/auth_data_source.dart';
import 'package:finsage/fearures/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
AuthDataSource authDataSource;
AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<Failure, void>> register(String username, String email, String password)async {
  return authDataSource.register(username, email, password);
  }

  @override
  Future<Either<Failure, void>> login(String email, String password) {
    return authDataSource.login(email, password);
  }

}