import 'package:dartz/dartz.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/features/auth/domain/entities/auth_user.dart';
import 'package:Flavorly/features/auth/domain/repository/auth_repository.dart';

class StreamAuthUserUseCase {
  final AuthRepository authRepository;

  StreamAuthUserUseCase({required this.authRepository});

  Stream<Either<Failure, AuthUser>> call() {
    try {
      return authRepository.user;
    } catch (e) {
      return Stream.value(Left(SeverFailure(e.toString())));
    }
  }
}
