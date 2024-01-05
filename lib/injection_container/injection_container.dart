import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/features/auth/data/data_sources/local/local_data_source.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_data_source_firebase.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_fire_store_data_source.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_fire_store_data_source_impl.dart';
import 'package:recipe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:recipe_app/features/auth/data/repositories/user_repository.dart';
import 'package:recipe_app/features/auth/domain/repository/auth_repository.dart';
import 'package:recipe_app/features/auth/domain/repository/user_repository.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/get_user_from_local_data_base_usw_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/isAppFirstTimeOpened.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/is_sign_in_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_in_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_in_with_google_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_out_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/sign_up_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/auth_repository_use_cases/stream_of_auth_user_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/user_repository_use_cases/delete_user_from_local_storage_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/user_repository_use_cases/get_user_from_fire_store_use_case.dart';
import 'package:recipe_app/features/auth/domain/usecases/user_repository_use_cases/get_user_from_local_storage.dart';
import 'package:recipe_app/features/auth/domain/usecases/user_repository_use_cases/update_user_on_fire_store.dart';
import 'package:recipe_app/features/auth/domain/usecases/user_repository_use_cases/upload_user_to_fire_store_use_case.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/auth_bloc/auth_bloc.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/sign_out_bloc/sign_out_bloc.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:recipe_app/features/home/data/data_sources/remote/remote_data_source.dart';
import 'package:recipe_app/features/home/data/data_sources/remote/remote_data_source_impl.dart';
import 'package:recipe_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';
import 'package:recipe_app/features/home/domain/usecases/get_categories_recipes_use_case.dart';
import 'package:recipe_app/features/home/domain/usecases/get_menu_recipe_use_case.dart';
import 'package:recipe_app/features/home/domain/usecases/get_recipe_detail_use_case.dart';
import 'package:recipe_app/features/home/domain/usecases/get_recipies_by_nutrients.dart';
import 'package:recipe_app/features/home/domain/usecases/get_recommended_item_usecase.dart';
import 'package:recipe_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:recipe_app/features/home/presentation/category_page_bloc/bloc/category_bloc.dart';
import 'package:recipe_app/features/home/presentation/detail_page_bloc/bloc/recipe_detail_bloc.dart';
import 'package:recipe_app/features/onBoardingScreen/presentation/bloc/animation_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/auth/presentation/auth_blocs/login_bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Blocs registration
  //* Authentication blocs registration
  sl.registerFactory(() => LoginBloc(sl(), sl()));
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));
  sl.registerFactory(() => SignOutBloc(sl()));
  sl.registerFactory(() => SignUpBloc(sl(), sl()));
  sl.registerFactory(() => AnimationBloc());
  sl.registerFactory(() => HomeBloc(sl(), sl(), sl(), sl()));
  // sl.registerFactory(() => RecommendedItemBloc(sl(), sl()));
  sl.registerFactory(() => RecipeDetailBloc(sl()));
  sl.registerFactory(() => CategoryBloc(sl()));

  //* Use cases
  //! Auth
  sl.registerLazySingleton(() => StreamAuthUserUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignOutUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => IsSignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(
      () => GetUserFromLocalStorageUseCase(localDataSource: sl()));
  sl.registerLazySingleton(() => IsAppFirstTimeOpenedUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignInWithGoogleUseCase(authRepository: sl()));

  //! User
  sl.registerLazySingleton(
      () => GetUserFromFireStoreUseCase(userRepository: sl()));
  sl.registerLazySingleton(
      () => DeleteUserFromLocalStorageUseCase(userRepository: sl()));
  sl.registerLazySingleton(
      () => UploadUserToFireStoreUseCase(userRepository: sl()));

  sl.registerLazySingleton(
      () => UpdateUserOnFireStoreUseCase(userRepository: sl()));
  // sl.registerLazySingleton(
  //     () => DeleteUserFromLocalStorageUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => GetUserFromLocalStorage(userRepository: sl()));

  //! Home
  sl.registerLazySingleton(
      () => GetCategoriesRecipesUseCase(homeRepository: sl()));
  sl.registerLazySingleton(
      () => GetRecipesByNutrientsUseCase(homeRepository: sl()));
  sl.registerLazySingleton(
      () => GetRecommendedItemUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => GetMenuRecipeUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetRecipeDetailUseCase(repository: sl()));
  // sl.registerLazySingleton(
  //     () => GetCategoriesRecipesUseCase(homeRepository: sl()));

  //! Auth Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
        localDataSource: sl(),
        remoteFireStoreDataSource: sl()),
  );

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  //! Auth Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton(() => LocalDataSource(sl()));

  sl.registerLazySingleton<RemoteFireStoreDataSource>(
      () => RemoteFireStoreDataSourceImpl());

//! Home Repositories
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSource: sl(), networkInfo: sl()));

  //! Home Repository data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dio: sl()),
  );

  //* core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! Dio
  sl.registerLazySingleton(() => Dio());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
