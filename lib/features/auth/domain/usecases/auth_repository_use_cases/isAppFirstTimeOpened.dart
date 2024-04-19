// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/auth/domain/repository/auth_repository.dart';

class IsAppFirstTimeOpenedUseCase implements UseCase<bool, NoParams> {
  final AuthRepository repository;
  const IsAppFirstTimeOpenedUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    try {
      return await repository.isAppFirstTimeOpened();
    } catch (e) {
      return Left(UnknownError(e.toString()));
    }
  }
}
