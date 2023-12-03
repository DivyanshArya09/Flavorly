import 'package:dartz/dartz.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';
import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Stream<Either<Failure, AuthUser>> get user;

  Future<Either<Failure, AuthUser>> signIn(String email, String password);

  Future<Either<Failure, AuthUser>> signUp(
      String email, String password, String name);

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, AuthUser>> signInWithGoogle();

  Future<Either<Failure, bool>> isLoggedIn();

  Future<Either<Failure, AuthUser?>> getDataFromLocal();

  Future<Either<Failure, bool>> isAppFirstTimeOpened();
}
