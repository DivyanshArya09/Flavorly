import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_user.dart';

class SignUpUseCase implements UseCase<AuthUser, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});
  @override
  Future<Either<Failure, AuthUser>> call(SignUpParams params) async {
    return await authRepository.signUp(
        params.email, params.password, params.name);
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String name;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object?> get props => [email, password, name];

  @override
  String toString() {
    return 'Params(email: $email, password: $password)';
  }
}
