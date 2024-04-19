// import 'package: mockito/anota';

import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:Flavorly/core/network/network_info.dart';
import 'package:Flavorly/features/home/data/data_sources/remote/remote_data_source.dart';
import 'package:Flavorly/features/home/domain/repositories/home_repository.dart';
import 'package:Flavorly/features/home/domain/usecases/get_categories_recipes_use_case.dart';
import 'package:Flavorly/features/home/domain/usecases/get_menu_recipe_use_case.dart';
import 'package:Flavorly/features/home/domain/usecases/get_recipies_by_nutrients.dart';
import 'package:Flavorly/features/home/domain/usecases/get_recommended_item_usecase.dart';
import 'package:Flavorly/features/home/presentation/bloc/home_bloc.dart';

@GenerateMocks([
  HomeRepository,
  Dio,
  HomeRemoteDataSource,
  NetworkInfo,
  GetCategoriesRecipesUseCase,
  GetRecipesByNutrientsUseCase,
  GetMenuRecipeUseCase,
  GetRecommendedItemUseCase,
], customMocks: [
  // MockSpec<Dio>(as: #MockDio),
])
void main() {}
