import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';
import 'package:recipe_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/usecase/use_case.dart';

class SignInWithGoogle implements UseCase<AuthUser, NoParams> {
  final AuthRepository authRepository;

  SignInWithGoogle({required this.authRepository});

  @override
  Future<Either<Failure, AuthUser>> call(NoParams params) {
    throw UnimplementedError();
  }
}
