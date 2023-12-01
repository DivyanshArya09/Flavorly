import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/auth/data/data_sources/local/local_data_source.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';
import 'package:recipe_app/features/auth/domain/repository/auth_repository.dart';

class GetUserFromLocalStorageUseCase implements UseCase<AuthUser, NoParams> {
  final LocalDataSource localDataSource;
  final AuthRepository authRepository;
  const GetUserFromLocalStorageUseCase(
      {required this.localDataSource, required this.authRepository});

  @override
  Future<Either<Failure, AuthUser>> call(NoParams params) async {
    try {
      final user = await localDataSource.getUser();
      return Right(user!.toEntity());
    } catch (e) {
      return Left(UnknownError(e.toString()));
    }
  }
}
