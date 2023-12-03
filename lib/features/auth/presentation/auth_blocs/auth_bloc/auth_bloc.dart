import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/get_user_from_local_data_base_usw_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/isAppFirstTimeOpened.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/is_sign_in_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetUserFromLocalStorageUseCase getUserFromLocalStorageUseCase;
  final IsAppFirstTimeOpenedUseCase isAppFirstTimeOpenedUseCase;
  AuthBloc(this.isSignInUseCase, this.getUserFromLocalStorageUseCase,
      this.isAppFirstTimeOpenedUseCase)
      : super(AuthInitial()) {
    on<AppStarted>((event, emit) => _AppStartedEvent(event, emit));
  }

  Future<void> _AppStartedEvent(
      AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final isAppFirstTimeOpened =
        await isAppFirstTimeOpenedUseCase.call(NoParams());
    bool isAppFirstTimeOpenedResult = false;

    isAppFirstTimeOpened.fold((l) => isAppFirstTimeOpenedResult,
        (r) => isAppFirstTimeOpenedResult = r);
    if (!isAppFirstTimeOpenedResult) {
      emit(AppFirstTimeOpened());
    } else {
      final isSignInResult = await isSignInUseCase.call();
      final getUserResult =
          await getUserFromLocalStorageUseCase.call(NoParams());
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
}
