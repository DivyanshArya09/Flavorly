import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/error/failure.dart' as failure;
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:recipe_app/features/home/presentation/bloc/home_bloc.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late HomeBloc homeBloc;
  late MockGetCategoriesRecipesUseCase mockGetCategoriesRecipesUseCase;
  late MockGetRecipesByNutrientsUseCase mockGetRecipesByNutrientsUseCase;
  late MockGetMenuRecipeUseCase mockGetMenuRecipeUseCase;
  late MockGetRecommendedItemUseCase mockGetRecommendedItemUseCase;

  setUp(() {
    mockGetCategoriesRecipesUseCase = MockGetCategoriesRecipesUseCase();
    mockGetRecipesByNutrientsUseCase = MockGetRecipesByNutrientsUseCase();
    mockGetMenuRecipeUseCase = MockGetMenuRecipeUseCase();
    mockGetRecommendedItemUseCase = MockGetRecommendedItemUseCase();

    homeBloc = HomeBloc(
        mockGetCategoriesRecipesUseCase,
        mockGetRecipesByNutrientsUseCase,
        mockGetMenuRecipeUseCase,
        mockGetRecommendedItemUseCase);
  });

  test(
    'initial state should be HomeInitial',
    () {
      expect(homeBloc.state.status, HomeStatus.initial);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'should emits [loading, success] when HomeEvent is added.',
    build: () {
      when(mockGetCategoriesRecipesUseCase.call(any)).thenAnswer(
          (realInvocation) async => const Right(<CategoryEntity>[]));
      when(mockGetRecipesByNutrientsUseCase.call(any)).thenAnswer(
          (realInvocation) async => const Right(<NutrientRecipeEntity>[]));
      when(mockGetMenuRecipeUseCase.call(any)).thenAnswer(
          (realInvocation) async => const Right(<MenuRecipeEntity>[]));
      when(mockGetRecommendedItemUseCase.call(any)).thenAnswer(
          (realInvocation) async => const Right(<RecommendRecipeEntity>[]));
      return homeBloc;
    },
    act: (bloc) => bloc.add(const HomeInitialEvent(
        category: 'category',
        id: 56,
        menuItem: 'sample',
        numberOfMenuItemsYouWant: 1,
        nutrients: ['nutrient'],
        concentration: 1)),
    wait: const Duration(milliseconds: 500),
    expect: () => <HomeState>[
      const HomeState(
        status: HomeStatus.loading,
      ),
      const HomeState(
        status: HomeStatus.success,
        categories: <CategoryEntity>[],
        nutrients: <NutrientRecipeEntity>[],
        recommendedItems: <RecommendRecipeEntity>[],
        menuItems: <MenuRecipeEntity>[],
      ),
    ],
  );

// ConnectionFailure

  blocTest<HomeBloc, HomeState>(
    'should emits [loading, error] when HomeEvent is added.',
    build: () {
      when(mockGetCategoriesRecipesUseCase.call(any))
          .thenAnswer((realInvocation) async => Left(failure.SeverFailure('')));
      when(mockGetRecipesByNutrientsUseCase.call(any))
          .thenAnswer((realInvocation) async => Left(failure.SeverFailure('')));
      when(mockGetMenuRecipeUseCase.call(any))
          .thenAnswer((realInvocation) async => Left(failure.SeverFailure('')));
      when(mockGetRecommendedItemUseCase.call(any))
          .thenAnswer((realInvocation) async => Left(failure.SeverFailure('')));
      return homeBloc;
    },
    act: (bloc) => bloc.add(const HomeInitialEvent(
        category: 'category',
        id: 56,
        menuItem: 'sample',
        numberOfMenuItemsYouWant: 1,
        nutrients: ['nutrient'],
        concentration: 1)),
    wait: const Duration(milliseconds: 500),
    expect: () => <HomeState>[
      const HomeState(
        status: HomeStatus.loading,
      ),
      const HomeState(
        status: HomeStatus.error,
        failure: Failure.server,
      ),
    ],
  );
}
