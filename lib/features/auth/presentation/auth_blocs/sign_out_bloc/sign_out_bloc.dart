import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Flavorly/core/usecase/use_case.dart';
import 'package:Flavorly/features/auth/domain/usecases/auth_repository_use_cases/sign_out_use_case.dart';
import '../../../../../core/error/failure.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final SignOutUseCase signOutUseCase;
  SignOutBloc(this.signOutUseCase) : super(SignOutInitial()) {
    on<SignOutButtonPressed>(
        (event, emit) => _signOutButtonPressed(event, emit));
  }

  Future<void> _signOutButtonPressed(
      SignOutButtonPressed event, Emitter<SignOutState> emit) async {
    emit(SignOutLoading());
    final signOutResult = await signOutUseCase.call(NoParams());

    signOutResult.fold((failure) {
      if (failure is SeverFailure) {
        emit(const SignOutServerFailure("can't reach the servers"));
      } else {
        emit(const SignOutError("some thing went wrong"));
      }
    }, (success) => emit(SignOutLoaded()));
  }
}
