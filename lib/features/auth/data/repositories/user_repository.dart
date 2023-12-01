import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';
import 'package:recipe_app/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, void>> deleteUserFromLocalStorage() {
    // TODO: implement deleteUserFromLocalStorage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthUser>> getUserFromLocalStorage() {
    // TODO: implement getUserFromLocalStorage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveUserToLocalStorage(
      String name, String email, String uid) {
    // TODO: implement saveUserToLocalStorage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUserOnFireStore(
      String name, String email, String uid) {
    // TODO: implement updateUserOnFireStore
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> uploadUserToFireStore(
      String name, String email, String uid) {
    // TODO: implement uploadUserToFireStore
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthUser>> getUserFromFireStore(String uid) {
    // TODO: implement getUserFromFireStore
    throw UnimplementedError();
  }
}
