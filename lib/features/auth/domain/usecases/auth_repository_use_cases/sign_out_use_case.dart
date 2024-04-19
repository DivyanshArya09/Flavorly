import 'package:dartz/dartz.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/features/auth/domain/repository/auth_repository.dart';

import '../../../../../core/usecase/use_case.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    try {
      return await authRepository.signOut();
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }
}
