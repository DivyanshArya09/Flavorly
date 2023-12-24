import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/home/domain/entites/recommended_entity.dart';
import 'package:recipe_app/features/home/domain/usecases/get_random_recipes_use_case.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHomeRepository mockHomeRepository;
  late GetRandomRecipeUseCase getRandomRecipeUseCase;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getRandomRecipeUseCase =
        GetRandomRecipeUseCase(repository: mockHomeRepository);
  });

  test('should get recipes list of random from the repository', () async {
    // arrange
    when(mockHomeRepository.getRandomRecipes()).thenAnswer(
        (realInvocation) async => const Right(<RecommendedEntity>[]));

    // act
    final result = await getRandomRecipeUseCase.call(NoParams());

    // assert
    expect(result, const Right(<RecommendedEntity>[]));
  });
}
