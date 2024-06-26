import 'package:dartz/dartz.dart';
import 'package:Flavorly/core/error/failure.dart';

import '../../domain/entities/auth_user.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> uploadUserToFireStore(
      String name, String email, String uid);

  Future<Either<Failure, AuthUser>> getUserFromFireStore(String uid);

  Future<Either<Failure, AuthUser>> getUserFromLocalStorage();

  Future<Either<Failure, void>> saveUserToLocalStorage(
      String name, String email, String uid);

  Future<Either<Failure, void>> deleteUserFromLocalStorage();

  Future<Either<Failure, void>> updateUserOnFireStore(
      String name, String email, String uid);
}
