import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';

import '../../domain/entities/auth_user.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> uploadUserToFireStore(
      String name, String email, String uid);

  Future<Either<Failure, AuthUser>> getUserFromFireStore();

  Future<Either<Failure, AuthUser>> getUserFromLocalStorage();

  Future<Either<Failure, void>> saveUserToLocalStorage(
      String name, String email, String uid);

  Future<Either<Failure, void>> deleteUserFromLocalStorage();

  Future<Either<Failure, void>> updateUserInFireStore(
      String name, String email, String uid);
}
