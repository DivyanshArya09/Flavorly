import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/usecases/get_categories_recipes_use_case.dart';
import 'package:recipe_app/features/home/domain/usecases/get_menu_recipe_use_case.dart';
import 'package:recipe_app/features/home/domain/usecases/get_recipies_by_nutrients.dart';
import 'package:recipe_app/features/home/domain/usecases/get_recommended_item_usecase.dart';

// import '../../../../../test/features/home/helper/test_helper.mocks.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoriesRecipesUseCase getCategoriesRecipesUseCase;
  GetRecipesByNutrientsUseCase getRecipesByNutrientsUseCase;
  GetMenuRecipeUseCase getMenuRecipeUseCase;
  GetRecommendedItemUseCase getRecommendedItemUseCase;
  HomeBloc(
    this.getCategoriesRecipesUseCase,
    this.getRecipesByNutrientsUseCase,
    this.getMenuRecipeUseCase,
    this.getRecommendedItemUseCase,
  ) : super(HomeState()) {
    on<HomeInitialEvent>(
      (event, emit) async {
        emit(state.copyWith(status: HomeStatus.loading));
        List<MenuRecipeEntity> menuItems = [];
        List<CategoryEntity> categories = [];
        List<RecommendRecipeEntity> recommendedItems = [];
        List<NutrientRecipeEntity> nutrients = [];

        // fetching recommended recipes
        final recommendedRecipeResult = await getRecommendedItemUseCase.call(
          RecommendedRecipeParams(
            id: event.id,
          ),
        );

        // Checking errors for recommended Results
        recommendedRecipeResult.fold((error) {
          if (error is ConnectionFailure) {
            emit(state.copyWith(
              status: HomeStatus.error,
              failure: Failure.connection,
            ));
            return;
          }
          if (error is SeverFailure) {
            emit(state.copyWith(
              status: HomeStatus.error,
              failure: Failure.server,
            ));
            return;
          }
        }, (r) {
          recommendedItems = r;
        });

        // fetching menu recipes
        final menuRecipeResult = await getMenuRecipeUseCase.call(
          MenuRecipeParams(menuItem: event.menuItem, number: event.id),
        );
        // Checking errors for menu Results
        menuRecipeResult.fold((error) {
          if (error is ConnectionFailure) {
            emit(state.copyWith(
              status: HomeStatus.error,
              failure: Failure.connection,
            ));
            return;
          }
          if (error is SeverFailure) {
            emit(state.copyWith(
              status: HomeStatus.error,
              failure: Failure.server,
            ));
          }
        }, (r) {
          menuItems = r;
        });

        // fetching Nutrient recipes
        final nutrientRecipeResult = await getRecipesByNutrientsUseCase.call(
            NutrientsParams(
                nutrients: event.nutrients,
                concentration: event.concentration));

        // Checking errors for Nutrient Results
        nutrientRecipeResult.fold((error) {
          if (error is ConnectionFailure) {
            emit(state.copyWith(
              status: HomeStatus.error,
              failure: Failure.connection,
            ));
            return;
          }
          if (error is SeverFailure) {
            emit(state.copyWith(
              status: HomeStatus.error,
              failure: Failure.server,
            ));
          }
        }, (r) {
          nutrients = r;
        });

        // fetching categories
        final categoryResult = await getCategoriesRecipesUseCase
            .call(CategoriesParams(category: event.category));
        // Checking errors for category Results
        categoryResult.fold((error) {
          if (error is ConnectionFailure) {
            emit(state.copyWith(
              status: HomeStatus.error,
              failure: Failure.connection,
            ));
            return;
          }
          if (error is SeverFailure) {
            emit(state.copyWith(
              status: HomeStatus.error,
              failure: Failure.server,
            ));
          }
        }, (r) {
          categories = r;
        });

        emit(state.copyWith(
          status: HomeStatus.success,
          recommendedItems: recommendedItems,
          menuItems: menuItems,
          nutrients: nutrients,
          categories: categories,
        ));
      },
    );
  }
}
