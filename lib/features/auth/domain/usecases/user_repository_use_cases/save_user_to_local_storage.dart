import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:Flavorly/core/error/failure.dart';

import '../../../../../core/usecase/use_case.dart';
import '../../repository/user_repository.dart';

class SaveUserToLocalStorage
    implements UseCase<void, AddUserToLocalStorageUseCaseParams> {
  final UserRepository userRepository;

  SaveUserToLocalStorage({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(
      AddUserToLocalStorageUseCaseParams params) async {
    try {
      return await userRepository.saveUserToLocalStorage(
          params.name, params.email, params.uid);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}

class AddUserToLocalStorageUseCaseParams extends Equatable {
  final String name, email, uid;
  const AddUserToLocalStorageUseCaseParams(
      {required this.name, required this.email, required this.uid});

  @override
  List<Object?> get props => [name, email, uid];
}
