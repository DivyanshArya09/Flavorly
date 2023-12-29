import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/usecases/get_recipies_by_nutrients.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHomeRepository mockHomeRepository;
  late GetRecipesByNutrientsUseCase getRecipesByNutrientsUseCase;

  setUp(() async {
    mockHomeRepository = MockHomeRepository();
    getRecipesByNutrientsUseCase = GetRecipesByNutrientsUseCase(
      homeRepository: mockHomeRepository,
    );
  });

  List<NutrientRecipeEntity> dummyList = const [
    NutrientRecipeEntity(
      id: 1,
      title: "Recipe 1",
      calories: 300,
      carbs: '40',
      fat: '15',
      protein: '18',
      image: "https://example.com/recipe1.jpg",
      imageType: "jpg",
    ),
    NutrientRecipeEntity(
      id: 2,
      title: "Recipe 2",
      calories: 400,
      carbs: '30.0',
      fat: '20.0',
      protein: '25.0',
      image: "https://example.com/recipe2.jpg",
      imageType: "jpg",
    ),
    NutrientRecipeEntity(
      id: 3,
      title: "Recipe 3",
      calories: 350,
      carbs: '35',
      fat: '18',
      protein: '22',
      image: "https://example.com/recipe3.jpg",
      imageType: "jpg",
    ),
    // Add more dummy data as needed
  ];

  test('should get recipes list from the repository by nutrients', () async {
    // arrange
    when(mockHomeRepository.getRecipesByNutrients(['minCrabs'], 10))
        .thenAnswer((realInvocation) async => Right(dummyList));

    // act
    final result = await getRecipesByNutrientsUseCase.call(
        const NutrientsParams(nutrients: ['minCrabs'], concentration: 10));

    // assert
    expect(result, Right(dummyList));
  });
}
