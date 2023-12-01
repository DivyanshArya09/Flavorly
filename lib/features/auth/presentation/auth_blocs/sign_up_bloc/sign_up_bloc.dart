import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_up_use_case.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/auth_user.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signInUseCase;
  bool isPassWordVisible = true;
  SignUpBloc(this.signInUseCase) : super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) => _signUpButtonPressed(event, emit));
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
      emit(SignUpLoaded(success));
    });
  }
}
