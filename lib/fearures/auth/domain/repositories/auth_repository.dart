import 'package:dartz/dartz.dart';
import 'package:finsage/core/errors/failures.dart';

abstract class AuthRepo{
   Future<Either<Failure, void>>register(
      String username, String email, String password,);

   Future<Either<Failure, void>>login(String email, String password,);
}