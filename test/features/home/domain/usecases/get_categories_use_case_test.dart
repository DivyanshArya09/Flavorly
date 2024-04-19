import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:Flavorly/features/home/domain/entites/category_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/usecases/get_categories_recipes_use_case.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHomeRepository mockHomeRepository;
  late GetCategoriesRecipesUseCase getCategoriesRecipesUseCase;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getCategoriesRecipesUseCase =
        GetCategoriesRecipesUseCase(homeRepository: mockHomeRepository);
  });

  List<CategoryEntity> dummyCategoryList = const [
    CategoryEntity(
      id: 1,
      title: "Category 1",
      readyInMinutes: 30,
      servings: 4,
      sourceUrl: "https://example.com/category1",
      image: "https://example.com/category1.jpg",
    ),
    CategoryEntity(
      id: 2,
      title: "Category 2",
      readyInMinutes: 45,
      servings: 6,
      sourceUrl: "https://example.com/category2",
      image: "https://example.com/category2.jpg",
    ),
    CategoryEntity(
      id: 3,
      title: "Category 3",
      readyInMinutes: 60,
      servings: 8,
      sourceUrl: "https://example.com/category3",
      image: "https://example.com/category3.jpg",
    ),
  ];

  test('should get recipes list of categories from the repository', () async {
    // arrange
    const String category = 'category';
    when(mockHomeRepository.getCategoriesOfRecipes(category))
        .thenAnswer((realInvocation) async => Right(dummyCategoryList));

    //act
    final result = await getCategoriesRecipesUseCase
        .call(const CategoriesParams(category: category));

    // assert
    expect(result, Right(dummyCategoryList));
  });
}
