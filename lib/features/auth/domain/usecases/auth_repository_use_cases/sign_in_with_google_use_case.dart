import 'package:dartz/dartz.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/features/auth/domain/entities/auth_user.dart';
import 'package:Flavorly/features/auth/domain/repository/auth_repository.dart';

import '../../../../../core/usecase/use_case.dart';

class SignInWithGoogleUseCase implements UseCase<AuthUser, NoParams> {
  final AuthRepository authRepository;

  SignInWithGoogleUseCase({required this.authRepository});

  @override
  Future<Either<Failure, AuthUser>> call(NoParams params) async {
    return await authRepository.signInWithGoogle();
  }
}
