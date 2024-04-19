import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:Flavorly/features/auth/domain/entities/auth_user.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/use_case.dart';
import '../../repository/auth_repository.dart';

class SignInUseCase implements UseCase<AuthUser, SignInParams> {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  @override
  Future<Either<Failure, AuthUser>> call(SignInParams params) async {
    try {
      return await authRepository.signIn(params.email, params.password);
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  @override
  String toString() {
    return 'Params(email: $email, password: $password)';
  }
}
