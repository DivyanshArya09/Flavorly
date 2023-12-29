part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, error }

enum Failure { server, connection, firebase, unknown }

class HomeState extends Equatable {
  final HomeStatus status;
  final Failure? failure;
  final List<MenuRecipeEntity>? menuItems;
  final List<CategoryEntity>? categories;
  final List<RecommendRecipeEntity>? recommendedItems;
  final List<NutrientRecipeEntity>? nutrients;
  const HomeState(
      {this.categories,
      this.menuItems,
      this.recommendedItems,
      this.failure,
      this.nutrients,
      this.status = HomeStatus.initial});

  HomeState copyWith({
    List<CategoryEntity>? categories,
    List<RecommendRecipeEntity>? recommendedItems,
    List<NutrientRecipeEntity>? nutrients,
    List<MenuRecipeEntity>? menuItems,
    HomeStatus? status,
    Failure? failure,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      recommendedItems: recommendedItems ?? this.recommendedItems,
      nutrients: nutrients ?? this.nutrients,
      menuItems: menuItems ?? this.menuItems,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props =>
      [status, failure, menuItems, categories, recommendedItems, nutrients];
}
