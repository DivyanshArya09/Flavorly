import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/features/home/data/models/recommended_item_model.dart';
import 'package:recipe_app/features/home/domain/entites/category_entity.dart';
import 'package:recipe_app/features/home/domain/entites/recommended_entity.dart';
// import 'package:recipe_app/features/home/presentation/pages/home_page/components/recommendation.dart';

void main() {
  RecommendedModel model = RecommendedModel(
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

  test('recommended model should be subclass of RecommendedEntity', () {
    //assert
    expect(model, isA<RecommendedEntity>());
  });
}
