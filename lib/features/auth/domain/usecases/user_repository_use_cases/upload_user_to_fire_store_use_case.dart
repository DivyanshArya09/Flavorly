import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/auth/domain/repository/user_repository.dart';

import '../../../../../core/usecase/use_case.dart';

class UploadUserToFireStoreUseCase implements UseCase<void, NoParams> {
  final UserRepository userRepository;

  UploadUserToFireStoreUseCase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    try {
      await userRepository.uploadUserToFireStore();
    } catch (e) {}
  }
}

class UploadUserParams extends Equatable {
  final String email, name, uid;

  const UploadUserParams({
    required this.email,
    required this.name,
    required this.uid,
  });

  @override
  List<Object?> get props => [email, name, uid];
}
