import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/sign_out_use_case.dart';
import '../../../../../core/error/failure.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final SignOutUseCase signOutUseCase;
  SignOutBloc(this.signOutUseCase) : super(SignOutInitial()) {
    on<SignOutEvent>((event, emit) => _signOutButtonPressed(event, emit));
  }

  Future<void> _signOutButtonPressed(
      SignOutEvent event, Emitter<SignOutState> emit) async {
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
