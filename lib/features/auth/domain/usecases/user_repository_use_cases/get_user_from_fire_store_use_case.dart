import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';

import '../../../../../core/usecase/use_case.dart';
import '../../repository/user_repository.dart';

class GetUserFromFireStoreUseCase implements UseCase<AuthUser, NoParams> {
  final UserRepository userRepository;

  GetUserFromFireStoreUseCase({required this.userRepository});

  @override
  Future<Either<Failure, AuthUser>> call(NoParams params) async {
    try {
      return await userRepository.getUserFromFireStore();
    } on FireStoreError catch (e) {
      return Left(FireStoreError(e.message));
    } catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }
}
