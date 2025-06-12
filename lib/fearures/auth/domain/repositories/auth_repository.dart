import 'package:dartz/dartz.dart';
import 'package:CashClever/core/errors/failures.dart';

abstract class AuthRepo{
   Future<Either<Failure, void>>register(
      String username, String email, String password,);

   Future<Either<Failure, void>>login(String email, String password,);

   Future<Either<Failure, void>>resetPassword(String email);




}