import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';

import '../../domain/entities/auth_user.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> uploadUserToFireStore();

  Future<Either<Failure, AuthUser>> getUserFromFireStore();

  Future<Either<Failure, AuthUser>> getUserFromLocalStorage();

  Future<Either<Failure, void>> saveUserToLocalStorage(AuthUser user);

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> updateUserInFireStore(AuthUser user);
}
