import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/auth/domain/repository/user_repository.dart';

import '../../../../../core/usecase/use_case.dart';

class UploadUserToFireStoreUseCase implements UseCase<void, UploadUserParams> {
  final UserRepository userRepository;

  UploadUserToFireStoreUseCase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(UploadUserParams params) async {
    try {
      return await userRepository.uploadUserToFireStore(
          params.name, params.email, params.uid);
    } on FireStoreError catch (e) {
      return Left(FireStoreError(e.message));
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
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
