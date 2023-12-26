import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/config/constants/api_constants/constants.dart';
import 'package:recipe_app/core/error/exception.dart';
import 'package:recipe_app/features/home/data/data_sources/remote/remote_data_source_impl.dart';
import 'package:recipe_app/features/home/data/models/category_model.dart';
import 'package:recipe_app/features/home/data/models/nutrient_recipe_model.dart';
import 'package:recipe_app/features/home/data/models/recommended_item_model.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;
  late MockDio mockDio;

  setUp(
    () {
      mockDio = MockDio();
      homeRemoteDataSourceImpl = HomeRemoteDataSourceImpl(dio: mockDio);
    },
  );

  group(
    'getCategoriesOfRecipes test',
    () {
      test(
        'getCategoriesOfRecipes should return a valid CategoryModel list when the response code is 200',
        () async {
          // arrange
          when(
            mockDio.get(
              ApiUrls.getCategoriesRecipeUrl('cuisine', 10),
            ),
          ).thenAnswer(
            (realInvocation) async {
              return Response(
                statusCode: 200,
                data: {
                  "results": [
                    {
                      "readyInMinutes": 45,
                      "sourceUrl":
                          "http://foodandspice.blogspot.com/2016/08/spicy-black-eyed-pea-curry-with-swiss.html",
                      "image":
                          "spicy-black-eyed-pea-curry-with-swiss-chard-and-roasted-eggplant-798400.jpg",
                      "servings": 6,
                      "id": 798400,
                      "title":
                          "Spicy Black-Eyed Pea Curry with Swiss Chard and Roasted Eggplant"
                    },
                    {
                      "readyInMinutes": 45,
                      "sourceUrl":
                          "http://www.foodista.com/recipe/G6ZJW56S/gujarati-dry-mung-bean-curry",
                      "image": "Gujarati-Dry-Mung-Bean-Curry-646043.jpg",
                      "servings": 4,
                      "id": 646043,
                      "title": "Gujarati Dry Mung Bean Curry"
                    },
                    {
                      "readyInMinutes": 30,
                      "sourceUrl":
                          "http://www.foodista.com/recipe/2LQW8RTQ/indian-style-dill-and-turmeric-potatoes",
                      "image":
                          "Indian-Style-Dill-and-Turmeric-Potatoes-647875.jpg",
                      "servings": 4,
                      "id": 647875,
                      "title": "Indian-Style Dill and Turmeric Potato Salad"
                    },
                    {
                      "readyInMinutes": 45,
                      "sourceUrl":
                          "http://www.foodista.com/recipe/Z5MXNR2V/slow-cooker-lamb-curry",
                      "image": "Slow-Cooker-Lamb-Curry-660290.jpg",
                      "servings": 8,
                      "id": 660290,
                      "title": "Slow Cooker Lamb Curry"
                    },
                    {
                      "readyInMinutes": 45,
                      "sourceUrl":
                          "https://www.foodista.com/recipe/4ZL4SYFD/curry-mussels",
                      "image": "Curry-Mussels-641128.jpg",
                      "servings": 2,
                      "id": 641128,
                      "title": "Curry Mussels"
                    },
                    {
                      "readyInMinutes": 45,
                      "sourceUrl":
                          "http://www.foodista.com/recipe/VVMBG4PD/authentic-jamaican-curry-chicken",
                      "image": "Authentic-Jamaican-Curry-Chicken-633088.jpg",
                      "servings": 4,
                      "id": 633088,
                      "title": "Authentic Jamaican Curry Chicken"
                    },
                    {
                      "readyInMinutes": 45,
                      "sourceUrl":
                          "http://www.foodista.com/recipe/HFH8GVJS/fried-pumpkin-indian-style",
                      "image": "Fried-Pumpkin--Indian-Style-643775.jpg",
                      "servings": 12,
                      "id": 643775,
                      "title": "Indian-Style Pumpkin Side Dish"
                    },
                    {
                      "readyInMinutes": 45,
                      "sourceUrl":
                          "https://www.foodista.com/recipe/7Q3RC88N/easy-chicken-tikka-masala",
                      "servings": 4,
                      "id": 641908,
                      "title": "Easy Chicken Tikka Masala"
                    },
                    {
                      "readyInMinutes": 30,
                      "sourceUrl":
                          "http://www.foodista.com/recipe/WKQQKG5K/luscious-palak-paneer",
                      "image": "Luscious-Palak-Paneer-650484.jpg",
                      "servings": 2,
                      "id": 650484,
                      "title": "Luscious Palak Paneer"
                    },
                    {
                      "readyInMinutes": 45,
                      "sourceUrl":
                          "http://www.foodista.com/recipe/RVGM5HG8/green-curry-chicken-salad",
                      "image": "Green-Curry-Chicken-Salad-651726.jpg",
                      "servings": 2,
                      "id": 651726,
                      "title": "Green Curry Chicken Salad"
                    }
                  ],
                  "baseUri": "https://spoonacular.com/recipeImages/",
                  "offset": 0,
                  "number": 10,
                  "totalResults": 122,
                  "processingTimeMs": 20,
                  "expires": 1703759539066,
                  "isStale": false
                },
                requestOptions: RequestOptions(
                  path: ApiUrls.getCategoriesRecipeUrl('cuisine', 10),
                ),
              );
            },
          );

          // act
          final result =
              await homeRemoteDataSourceImpl.getCategoriesOfRecipes('cuisine');
          // assert
          expect(result, isA<List<CategoryModel>>());
        },
      );

      test(
        'getCategoriesOfRecipes should throw a ServerException when response code is 404',
        () async {
          // arrange
          when(mockDio.get(
            ApiUrls.getCategoriesRecipeUrl('cuisine', 10),
          )).thenAnswer(
            (realInvocation) async {
              return Response(
                statusCode: 404,
                requestOptions: RequestOptions(
                  path: ApiUrls.getCategoriesRecipeUrl('cuisine', 10),
                ),
                data: 'Not found',
              );
            },
          );
          //act
          final result = homeRemoteDataSourceImpl.getCategoriesOfRecipes(
            'cuisine',
          );

          //assert
          expect(result, throwsA(isA<ServerException>()));
        },
      );
    },
  );

  group(
    'getRecommendedRecipes test',
    () {
      test(
        'getRecommendedRecipes function should return valid List<RandomRecipeModel>',
        () async {
          // arrange
          when(
            mockDio.get(
              ApiUrls.getRecommendedRecipesUrl(7895),
            ),
          ).thenAnswer(
            (realInvocation) async {
              return Response(
                statusCode: 200,
                data: [
                  {
                    "id": 42676,
                    "imageType": "jpg",
                    "title": "The Not-quite Super Heebster Sandwich",
                    "readyInMinutes": 8,
                    "servings": 1,
                    "sourceUrl":
                        "http://www.sfgate.com/food/recipes/detail.html?rid=18247&sorig=qs"
                  },
                  {
                    "id": 552906,
                    "imageType": "jpg",
                    "title": "{Not Quite} Chichi’s Seafood Enchiladas",
                    "readyInMinutes": 60,
                    "servings": 10,
                    "sourceUrl":
                        "http://www.sumptuousspoonfuls.com/not-quite-chichis-seafood-enchiladas/"
                  }
                ],
                requestOptions: RequestOptions(
                  path: ApiUrls.getRecommendedRecipesUrl(7895),
                ),
              );
            },
          );

          // act
          final result = await homeRemoteDataSourceImpl.getRecommendedRecipes(
            7895,
          );

          // assert
          expect(result, isA<List<RecommendedRecipeModel>>());
        },
      );

      test(
        'getRecommendedRecipes should throw a ServerException',
        () async {
          // arrange
          when(mockDio.get(
            ApiUrls.getRecommendedRecipesUrl(7895),
          )).thenAnswer(
            (realInvocation) async {
              return Response(
                statusCode: 404,
                requestOptions: RequestOptions(
                  path: ApiUrls.getRecommendedRecipesUrl(7895),
                ),
                data: 'Not found',
              );
            },
          );
          // act
          final result = homeRemoteDataSourceImpl.getRecommendedRecipes(
            7895,
          );

          //assert
          expect(result, throwsA(isA<ServerException>()));
        },
      );
    },
  );

  group(
    'getRecipesByNutrients test',
    () {
      test(
        'getRecipesByNutrients function should return valid List<NutrientRecipeModel>',
        () async {
          // arrange
          when(
            mockDio.get(
              ApiUrls.getRecipeByNutrientsUrl(['maxCrabs'], 40),
            ),
          ).thenAnswer(
            (realInvocation) async {
              return Response(
                statusCode: 200,
                data: [
                  {
                    "id": 636392,
                    "title": "Buckwheat Crepes",
                    "image":
                        "https://spoonacular.com/recipeImages/636392-312x231.jpg",
                    "imageType": "jpg",
                    "calories": 374,
                    "protein": "13g",
                    "fat": "14g",
                    "carbs": "48g"
                  },
                  {
                    "id": 665019,
                    "title": "Watermelon Leaf Lettuce Salad With Light Feta",
                    "image":
                        "https://spoonacular.com/recipeImages/665019-312x231.jpg",
                    "imageType": "jpg",
                    "calories": 248,
                    "protein": "5g",
                    "fat": "18g",
                    "carbs": "16g"
                  }
                ],
                requestOptions: RequestOptions(
                    path: ApiUrls.getRecipeByNutrientsUrl(['maxCrabs'], 40)),
              );
            },
          );

          //act
          final result = await homeRemoteDataSourceImpl
              .getNutrientRecipes(['maxCrabs'], 40);

          // assert
          expect(result, isA<List<NutrientRecipeModel>>());
        },
        // act
      );

      test(
        'getRecipesByNutrients should throw a ServerException',
        () async {
          // arrange
          when(
            mockDio.get(
              ApiUrls.getRecipeByNutrientsUrl(['maxCrabs'], 40),
            ),
          ).thenAnswer(
            (realInvocation) async {
              return Response(
                data: 'Not Found',
                statusCode: 404,
                requestOptions: RequestOptions(
                  path: ApiUrls.getRecipeByNutrientsUrl(['maxCrabs'], 40),
                ),
              );
            },
          );
          //act
          final result = await homeRemoteDataSourceImpl
              .getNutrientRecipes(['minCrabs'], 10);
          //assert
          expect(result, throwsA(isA<ServerException>()));
        },
      );
    },
  );
}
