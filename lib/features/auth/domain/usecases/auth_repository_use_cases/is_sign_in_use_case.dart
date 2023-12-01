import 'package:dartz/dartz.dart';
import 'package:recipe_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../../core/error/failure.dart';

class IsSignInUseCase {
  final AuthRepository authRepository;
  const IsSignInUseCase({required this.authRepository});

  Future<Either<Failure, bool>> call() {
    return authRepository.isLoggedIn();
  }
}
