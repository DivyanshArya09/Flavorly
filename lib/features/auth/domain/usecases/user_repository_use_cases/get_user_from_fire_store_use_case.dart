import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';

import '../../../../../core/usecase/use_case.dart';
import '../../repository/user_repository.dart';

class GetUserFromFireStoreUseCase
    implements UseCase<AuthUser, GetUserFromFireStoreUseCaseParams> {
  final UserRepository userRepository;

  GetUserFromFireStoreUseCase({required this.userRepository});

  @override
  Future<Either<Failure, AuthUser>> call(
      GetUserFromFireStoreUseCaseParams params) async {
    try {
      return await userRepository.getUserFromFireStore(params.uid);
    } on FireStoreError catch (e) {
      return Left(FireStoreError(e.message));
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }
}

class GetUserFromFireStoreUseCaseParams extends Equatable {
  final String uid;

  const GetUserFromFireStoreUseCaseParams({required this.uid});

  @override
  List<Object?> get props => [uid];
}
