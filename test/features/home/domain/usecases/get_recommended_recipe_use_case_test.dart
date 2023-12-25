import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/home/domain/entites/random_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/usecases/get_random_recipes_use_case.dart';
import 'package:recipe_app/features/home/domain/usecases/get_recommended_item_usecase.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHomeRepository mockHomeRepository;
  late GetRecommendedItemUseCase getRandomRecipeUseCase;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getRandomRecipeUseCase =
        GetRecommendedItemUseCase(homeRepository: mockHomeRepository);
  });

  List<RecommendRecipeEntity> dummyRandomRecipesList = const [
    RecommendRecipeEntity(
      id: 1,
      title: "Category 1",
      readyInMinutes: 30,
      servings: 4,
      sourceUrl: "https://example.com/category1",
      // image: "https://example.com/category1.jpg",
    ),
    RecommendRecipeEntity(
      id: 2,
      title: "Category 2",
      readyInMinutes: 45,
      servings: 6,
      sourceUrl: "https://example.com/category2",
      // image: "https://example.com/category2.jpg",
    ),
    RecommendRecipeEntity(
      id: 3,
      title: "Category 3",
      readyInMinutes: 60,
      servings: 8,
      sourceUrl: "https://example.com/category3",
      // image: "https://example.com/category3.jpg",
    ),
  ];

  test('should get recipes list of random from the repository', () async {
    // arrange
    when(mockHomeRepository.getRecommendedRecipes())
        .thenAnswer((realInvocation) async => Right(dummyRandomRecipesList));

    // act
    final result = await getRandomRecipeUseCase.call(NoParams());

    // assert
    expect(result, Right(dummyRandomRecipesList));
  });
}
