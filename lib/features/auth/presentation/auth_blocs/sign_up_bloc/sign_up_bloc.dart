import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_in_with_google_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_up_use_case.dart';
import '../../../../../core/error/failure.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signInUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  SignUpBloc(this.signInUseCase, this.signInWithGoogleUseCase)
      : super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) => _signUpButtonPressed(event, emit));
    on<SignInWithGoogleButtonPressed>(
        (event, emit) => _signUpWithGoogleButtonPressed(event, emit));
  }

  Future<void> _signUpButtonPressed(
      SignUpButtonPressed event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    final signUpResult = await signInUseCase.call(SignUpParams(
        email: event.email, password: event.password, name: event.name));
    signUpResult.fold((failure) {
      if (failure is SeverFailure) {
        emit(StopLoading());
        emit(SignUpServerFailure(failure.message));
      } else if (failure is ConnectionFailure) {
        emit(StopLoading());
        emit(SignUpConnectionFailure(failure.message));
      } else if (failure is FireBaseError) {
        emit(StopLoading());
        emit(SignUpFireBaseError(failure.message));
      } else {
        emit(StopLoading());
        emit(const SignUpError('some thing went wrong'));
      }
    }, (success) {
      emit(SignUpLoaded(
        name: success.name,
        email: success.email,
        uid: success.uid,
      ));
    });
  }

  Future<void> _signUpWithGoogleButtonPressed(
      SignInWithGoogleButtonPressed event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    final signInWithGoogleResult =
        await signInWithGoogleUseCase.call(NoParams());
    signInWithGoogleResult.fold((l) {
      if (l is SeverFailure) {
        emit(StopLoading());
        emit(SignUpServerFailure(l.message));
      } else if (l is ConnectionFailure) {
        emit(StopLoading());
        emit(SignUpConnectionFailure(l.message));
      } else if (l is FireBaseError) {
        emit(StopLoading());
        emit(SignUpFireBaseError(l.message));
      } else {
        emit(StopLoading());
        emit(const SignUpError('some thing went wrong'));
      }
    },
        (r) => emit(SignUpLoaded(
              name: r.name,
              email: r.email,
              uid: r.uid,
            )));
  }
}
