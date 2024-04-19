import 'package:dartz/dartz.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/auth/data/data_sources/local/local_data_source.dart';
import 'package:Flavorly/features/auth/domain/entities/auth_user.dart';

class GetUserFromLocalStorageUseCase implements UseCase<AuthUser, NoParams> {
  final LocalDataSource localDataSource;
  const GetUserFromLocalStorageUseCase({required this.localDataSource});

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
