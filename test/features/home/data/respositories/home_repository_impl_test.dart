import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/error/exception.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/home/data/models/category_model.dart';
import 'package:recipe_app/features/home/data/models/menu_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/nutrient_recipe_model.dart';
import 'package:recipe_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/menu_recipe_entiry.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHomeRemoteDataSource mockHomeRemoteDataSource;
  late HomeRepositoryImpl homeRepositoryImpl;
  late MockNetworkInfo mockNetworkInfo;

  setUp(
    () {
      mockHomeRemoteDataSource = MockHomeRemoteDataSource();
      mockNetworkInfo = MockNetworkInfo();
      homeRepositoryImpl = HomeRepositoryImpl(
        homeRemoteDataSource: mockHomeRemoteDataSource,
        networkInfo: mockNetworkInfo,
      );
    },
  );

  List<NutrientRecipeModel> nutrientRecipeTestListModel = const [
    NutrientRecipeModel(
      id: 627987,
      title: "onion pakoda recipe",
      calories: 218,
      carbs: '26g',
      fat: '6g',
      protein: '10g',
      image: "https://spoonacular.com/recipeImages/627987-312x231.jpg",
      imageType: "jpg",
    ),
  ];
  List<NutrientRecipeEntity> nutrientRecipeTestListEntity = const [
    NutrientRecipeEntity(
      id: 627987,
      title: "onion pakoda recipe",
      calories: 218,
      carbs: '26g',
      fat: '6g',
      protein: '10g',
      image: "https://spoonacular.com/recipeImages/627987-312x231.jpg",
      imageType: "jpg",
    ),
  ];

  group(
    'getNutrientRecipes test',
    () {
      test(
        'Should return a list of NutrientRecipeEntity',
        () async {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

          when(mockHomeRemoteDataSource.getNutrientRecipes(['maxCrabs'], 40))
              .thenAnswer(
                  (realInvocation) async => nutrientRecipeTestListModel);

          final result =
              await homeRepositoryImpl.getRecipesByNutrients(['maxCrabs'], 40);

          List<NutrientRecipeEntity> success = [];

          result.fold((l) => l, (r) => success = r);

          expect(success, equals(nutrientRecipeTestListEntity));
        },
      );

      test('should return connection failure when no internet', () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        final result =
            await homeRepositoryImpl.getRecipesByNutrients(['maxCrabs'], 40);

        expect(result, Left(ConnectionFailure('No internet connection')));
      });
    },
  );

  test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

    when(mockHomeRemoteDataSource.getNutrientRecipes(['maxCrabs'], 40))
        .thenThrow(ServerException());

    final result =
        await homeRepositoryImpl.getRecipesByNutrients(['maxCrabs'], 40);

    var failure = result.fold((l) => l, (r) => r);

    expect(failure, isA<SeverFailure>());
  });
  //! group test of getNutrient recipe ends here

  //* group test of getMenuRecipe starts here

  List<MenuRecipeEntity> menuRecipeTestEntityList = const [
    MenuRecipeEntity(
      sId: '1',
      id: 101,
      title: 'Grilled Chicken Salad',
      image: 'https://example.com/images/grilled_chicken_salad.jpg',
      imageType: 'jpg',
      restaurantChain: 'Healthy Bites',
      servings: Servings(
        number: 2,
        size: 4,
      ),
    ),
  ];
  List<MenuRecipeModel> menuRecipeTestModelList = const [
    MenuRecipeModel(
      sId: '1',
      id: 101,
      title: 'Grilled Chicken Salad',
      image: 'https://example.com/images/grilled_chicken_salad.jpg',
      imageType: 'jpg',
      restaurantChain: 'Healthy Bites',
      servings: Servings(
        number: 2,
        size: 4,
      ),
    ),
  ];

  group(
    'getMenuRecipe test',
    () {
      test(
        'Should return a list of MenuRecipeEntity',
        () async {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

          when(mockHomeRemoteDataSource.getMenuRecipes('burger', 10))
              .thenAnswer((realInvocation) async => menuRecipeTestModelList);

          final result = await homeRepositoryImpl.getMenuItems('burger', 10);

          List<MenuRecipeEntity> success = [];

          result.fold((l) => l, (r) => success = r);

          expect(success, equals(menuRecipeTestEntityList));
        },
      );

      test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

          when(mockHomeRemoteDataSource.getMenuRecipes('burger', 10))
              .thenThrow(ServerException());

          final result = await homeRepositoryImpl.getMenuItems('burger', 10);

          var failure = result.fold((l) => l, (r) => r);

          expect(failure, isA<SeverFailure>());
        },
      );
    },
  );
  //! get menu recipe test ends here

//* get category test starts here

  List<CategoryEntity> categoryTestEntityList = [];
  List<CategoryModel> categoryTestModelList = [];
  group(
    'getCategoriesOfRecipes test',
    () {
      test(
        'Should return a list of Category',
        () async {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

          when(mockHomeRemoteDataSource.getCategoriesOfRecipes('indian'))
              .thenAnswer((realInvocation) async => categoryTestModelList);

          final result =
              await homeRepositoryImpl.getCategoriesOfRecipes('indian');

          List<CategoryEntity> success = [];

          result.fold((l) => l, (r) => success = r);

          expect(success, equals(categoryTestEntityList));
        },
      );

      test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

          when(mockHomeRemoteDataSource.getMenuRecipes('burger', 10))
              .thenThrow(ServerException());

          final result =
              await homeRepositoryImpl.getCategoriesOfRecipes('indian');

          var failure = result.fold((l) => l, (r) => r);

          expect(failure, isA<SeverFailure>());
        },
      );
    },
  );
}
