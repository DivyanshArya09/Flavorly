import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_in_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_in_with_google_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUseCase signInUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  LoginBloc(this.signInUseCase, this.signInWithGoogleUseCase)
      : super(
          LoginInitial(),
        ) {
    on<LoginButtonPressed>((event, emit) => _loginButtonPressed(event, emit));
    on<LoginWithGoogleButtonPressed>(
        (event, emit) => _loginGoogleButtonPressed(event, emit));
  }

  Future<void> _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final signInResult = await signInUseCase
        .call(SignInParams(email: event.email, password: event.password));
    signInResult.fold(
      (failure) {
        if (failure is SeverFailure) {
          emit(StopLoginLoading());
          emit(LoginServerFailure(failure.message));
        } else if (failure is ConnectionFailure) {
          emit(StopLoginLoading());
          emit(LoginConnectionFailure(failure.message));
        } else if (failure is FireBaseError) {
          emit(StopLoginLoading());
          emit(LoginFireBaseError(failure.message));
        } else {
          emit(const LoginError('Some thing went wrong'));
        }
      },
      (success) => emit(
        LoginLoaded(email: success.email, name: success.name, uid: success.uid),
      ),
    );
  }

  Future<void> _loginGoogleButtonPressed(
      LoginWithGoogleButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final signInWithGoogleResult =
        await signInWithGoogleUseCase.call(NoParams());

    signInWithGoogleResult.fold(
      (failure) {
        if (failure is SeverFailure) {
          emit(StopLoginLoading());
          emit(LoginServerFailure(failure.message));
        }
        if (failure is ConnectionFailure) {
          emit(StopLoginLoading());
          emit(LoginConnectionFailure(failure.message));
        }
        if (failure is FireBaseError) {
          emit(StopLoginLoading());
          emit(LoginFireBaseError(failure.message));
        }
      },
      (success) => emit(
        LoginLoaded(
          email: success.email,
          name: success.name,
          uid: success.uid,
        ),
      ),
    );
  }
}
