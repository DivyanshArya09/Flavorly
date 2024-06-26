import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:Flavorly/features/home/domain/entites/random_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/usecases/get_random_recipes_use_case.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHomeRepository mockHomeRepository;

  late GetRandomRecipeUseCase getRandomRecipeUseCase;

  setUp(
    () {
      mockHomeRepository = MockHomeRepository();
      getRandomRecipeUseCase =
          GetRandomRecipeUseCase(repository: mockHomeRepository);
    },
  );

  RandomRecipeEntity dummyData = const RandomRecipeEntity(
    id: 1,
    aisle: 'Aisle 1',
    image: 'image_url',
    consistency: 'Solid',
    name: 'Product Name',
    nameClean: 'Product Name Clean',
    original: 'Original Product Name',
    originalName: 'Original Product Name Clean',
    amount: 2.5,
    unit: 'kg',
    meta: ['meta1', 'meta2'],
    measures: Measures(
        us: Us(amount: 1, unitLong: 'us', unitShort: 'us'),
        metric: Us(amount: 1, unitLong: 'metric', unitShort: 'metric')),
  );

  List<RandomRecipeEntity> dummyDataList = [dummyData, dummyData];

  test(
    'should get recommended items list from the repository',
    () async {
      when(mockHomeRepository.getRandomRecipes(2324))
          .thenAnswer((_) async => Right(dummyDataList));

      // assert
      final result = await getRandomRecipeUseCase
          .call(const RandomRecipeParams(number: 2324));

      print(result);
      // assert
      expect(result, Right(dummyDataList));
    },
  );
}
