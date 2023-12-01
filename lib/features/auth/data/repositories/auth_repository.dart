import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/features/auth/data/data_models/user_model.dart';
import 'package:recipe_app/features/auth/data/data_sources/local/local_data_source.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_fire_store_data_source.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/remote/remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;
  final RemoteFireStoreDataSource remoteFireStoreDataSource;
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteFireStoreDataSource,
  });

  @override
  Future<Either<Failure, AuthUser>> signIn(
      String email, String password) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      final userModel =
          await remoteDataSource.signInWithEmailPassword(email, password);

      return Right(userModel.toEntity());
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(FireBaseError(e.toString()));
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(FireBaseError(e.toString()));
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signUp(
      String email, String password, String name) async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      UserModel userModel =
          await remoteDataSource.signUpWithEmailPassword(email, password, name);
      await remoteFireStoreDataSource.uploadUserToFireStore(
          userModel.name, userModel.email, userModel.uid);
      await localDataSource.setUser(userModel);

      return Right(userModel.toEntity());
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(FireBaseError(e.toString()));
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, AuthUser>> get user {
    return remoteDataSource.user.map((event) {
      if (event == null) {
        return Left(SeverFailure('User is null'));
      }
      return Right(event.toEntity());
    });
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    if (!await networkInfo.isConnected) {
      return Left(ConnectionFailure('No internet connection'));
    }
    try {
      final isLogged = await remoteDataSource.isLoggedIn();
      return Right(isLogged);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(FireBaseError(e.toString()));
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthUser?>> getDataFromLocal() async {
    try {
      final user = await localDataSource.getUser();
      if (user == null) return const Right(null);
      return Right(user.toEntity());
    } catch (e) {
      return Left(UnknownError(e.toString()));
    }
  }
}
