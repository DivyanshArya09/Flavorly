import 'package:dartz/dartz.dart';
import 'package:Flavorly/core/error/failure.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/auth/domain/repository/user_repository.dart';

class DeleteUserFromLocalStorageUseCase implements UseCase<void, NoParams> {
  final UserRepository userRepository;
  const DeleteUserFromLocalStorageUseCase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    try {
      return await userRepository.deleteUserFromLocalStorage();
    } catch (e) {
      return Left(UnknownError(e.toString()));
    }
  }
}
