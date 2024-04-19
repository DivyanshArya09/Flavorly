import 'package:dartz/dartz.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/auth/domain/entities/auth_user.dart';
import 'package:Flavorly/features/auth/domain/repository/user_repository.dart';

class GetUserFromLocalStorage implements UseCase<AuthUser, NoParams> {
  final UserRepository userRepository;

  GetUserFromLocalStorage({required this.userRepository});
  @override
  Future<Either<Failure, AuthUser>> call(NoParams params) async {
    try {
      return await userRepository.getUserFromLocalStorage();
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
