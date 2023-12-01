import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/features/auth/data/data_sources/local/local_data_source.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_data_source_firebase.dart';
import 'package:recipe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:recipe_app/features/auth/domain/repository/auth_repository.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/get_user_from_local_data_base_usw_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/is_sign_in_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_in_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_out_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_up_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/stream_of_auth_user_use_case.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/auth_bloc/auth_bloc.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/sign_out_bloc/sign_out_bloc.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/auth/presentation/auth_blocs/login_bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Blocs registration
  //* Authentication blocs registration
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => AuthBloc(sl(), sl()));
  sl.registerFactory(() => SignOutBloc(sl()));
  sl.registerFactory(() => SignUpBloc(sl()));

  //* Use cases
  sl.registerLazySingleton(() => StreamAuthUserUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignOutUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => IsSignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetUserFromLocalStorageUseCase(
      localDataSource: sl(), authRepository: sl()));
  // sl.registerLazySingleton(() => SignInWithGoogleUseCase(authRepository: sl()));

  //! Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        remoteDataSource: sl(), networkInfo: sl(), localDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton(() => LocalDataSource(sl()));

  //* core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
