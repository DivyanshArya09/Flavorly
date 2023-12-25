import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/home/domain/entites/random_recipe_entity.dart';
import 'package:recipe_app/features/home/domain/usecases/get_random_recipes_use_case.dart';
import 'package:recipe_app/features/home/domain/usecases/get_recommended_item_usecase.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  MockHomeRepository mockHomeRepository;

  GetRandomRecipeUseCase getRandomRecipeUseCase;

  setUp(
    () {
      mockHomeRepository = MockHomeRepository();
      getRandomRecipeUseCase =
          GetRandomRecipeUseCase(repository: mockHomeRepository);

      RandomRecipeEntity dummyData = RandomRecipeEntity(
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
          when(mockHomeRepository.getRandomRecipes())
              .thenAnswer((_) async => Right(dummyDataList));

          // assert
          final result = await getRandomRecipeUseCase.call(NoParams());

          // assert
          expect(result, Right(dummyDataList));
        },
      );
    },
  );
}
