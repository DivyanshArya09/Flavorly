import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:recipe_app/features/home/domain/usecases/get_categories_recipes_use_case.dart';
import 'package:recipe_app/features/home/domain/usecases/get_menu_recipe_use_case.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late MockHomeRepository mockHomeRepository;
  late GetMenuRecipeUseCase getMenuRecipeUseCase;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getMenuRecipeUseCase = GetMenuRecipeUseCase(repository: mockHomeRepository);
  });

  List<MenuRecipeEntity> expectedResult = [
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
    MenuRecipeEntity(
      sId: '2',
      id: 102,
      title: 'Margherita Pizza',
      image: 'https://example.com/images/margherita_pizza.jpg',
      imageType: 'jpg',
      restaurantChain: 'Pizza Palace',
      servings: Servings(
        number: 4,
        size: 4,
      ),
    ),
    MenuRecipeEntity(
      sId: '3',
      id: 103,
      title: 'Vegetable Stir-Fry',
      image: 'https://example.com/images/vegetable_stir_fry.jpg',
      imageType: 'jpg',
      restaurantChain: 'Wok Wonders',
      servings: Servings(
        number: 3,
        size: 4,
      ),
    ),
    // Add more sample entities as needed
  ];
  test('should get recipes list of MenuRecipeEntity from the repository',
      () async {
    // arrange
    const String menuItem = 'sample_item';
    when(
      mockHomeRepository.getMenuItems(menuItem, 5),
    ).thenAnswer((realInvocation) async => Right(expectedResult));

    //act
    final result = await getMenuRecipeUseCase
        .call(const MenuRecipeParams(menuItem: menuItem, number: 5));

    // assert
    expect(result, Right(expectedResult));
  });
}
