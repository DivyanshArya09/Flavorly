import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/get_user_from_local_data_base_usw_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/is_sign_in_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetUserFromLocalStorageUseCase getUserFromLocalStorageUseCase;
  AuthBloc(this.isSignInUseCase, this.getUserFromLocalStorageUseCase)
      : super(AuthInitial()) {
    on<AppStarted>((event, emit) => _AppStartedEvent(event, emit));
  }

  Future<void> _AppStartedEvent(
      AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    emit(AuthLoading());
    final isSignInResult = await isSignInUseCase.call();
    final getUserResult = await getUserFromLocalStorageUseCase.call(NoParams());
    AuthUser? user;

    getUserResult.fold((l) {
      emit(Unauthenticated());
      return;
    }, (r) => user = r);

    isSignInResult.fold((l) {
      if (l is ConnectionFailure && user != null) {
        emit(Authenticated(user!.name, user!.email, user!.uid));
      } else {
        emit(Unauthenticated());
      }
    }, (r) {
      if (r) {
        emit(Authenticated(user!.name, user!.email, user!.uid));
      } else {
        emit(Unauthenticated());
      }
    });
  }
}
