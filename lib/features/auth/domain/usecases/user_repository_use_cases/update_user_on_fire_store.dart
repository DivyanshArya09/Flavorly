import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/auth/domain/repository/user_repository.dart';

class UpdateUserOnFireStoreUseCase
    implements UseCase<void, UpdateUserOnFireStoreUseCaseParams> {
  final UserRepository userRepository;

  const UpdateUserOnFireStoreUseCase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(
      UpdateUserOnFireStoreUseCaseParams params) async {
    try {
      return await userRepository.updateUserOnFireStore(
        params.name,
        params.email,
        params.uid,
      );
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }
}

class UpdateUserOnFireStoreUseCaseParams extends Equatable {
  final String name, email, uid;
  const UpdateUserOnFireStoreUseCaseParams(
      {required this.name, required this.email, required this.uid});

  @override
  List<Object?> get props => [];
}
