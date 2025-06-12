import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:CashClever/core/cache/shared_preferences.dart';
import 'package:CashClever/core/errors/failures.dart';
import 'package:CashClever/core/utils/firebase/firebase_utils.dart';
import 'package:CashClever/fearures/auth/data/data_sources/auth_data_source.dart';
import 'package:CashClever/fearures/auth/data/models/user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<Either<Failure, void>> register(
      String username, String email, String password) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return Left(Failure(errorMessage: "The Network Connection Is Lost"));
    }
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserDTO user = UserDTO(
        id: userCredential.user?.uid ?? "user id not found",
        name: username,
        email: email,
        balance: 0.0,
        expenses: 0.0,
        income: 0.0,
      );

      await FirebaseUtils.addUser(user); // Ensure this is awaited if it's async

      return Right(null); // Success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(Failure(
            errorMessage: "The account already exists for that email."));
      } else if (e.code == 'invalid-email') {
        return Left(Failure(errorMessage: "The email address is not valid."));
      } else if (e.code == 'weak-password') {
        return Left(
            Failure(errorMessage: "The password provided is too weak."));
      } else {
        return Left(Failure(errorMessage: "Error: ${e.message}"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: "Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return Left(Failure(errorMessage: "The Network Connection Is Lost"));
    }
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      UserDTO? userDoc =
          await FirebaseUtils.getUser(credential.user?.uid ?? "User Not Found");
      if (userDoc != null) {
        await SharedPrefs.setData(
          key: "LoggedInUser",
          value: userDoc.toJson(),
        );
      } else {
        return Left(Failure(errorMessage: "User Not Found in Firestore"));
      }
      return Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        return Left(Failure(errorMessage: "Wrong password"));
      } else {
        return Left(Failure(errorMessage: "${e.message}"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: " ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return Left(Failure(errorMessage: "The Network Connection Is Lost"));
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right(null);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
