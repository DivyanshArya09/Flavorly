import 'package:Flavorly/features/home/domain/entites/Nutrients_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/entites/category_recipe_entity.dart';
import 'package:Flavorly/features/home/domain/entites/menu_recipe_entiry.dart';
import 'package:Flavorly/features/home/domain/entites/recommend_recipe_entity.dart';

class TestDataList {
  static List<NutrientRecipeEntity> nutrient = const [
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

  static List<MenuRecipeEntity> menuItems = const [
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

  static List<CategoryEntity> categories = const [
    CategoryEntity(
      readyInMinutes: 45,
      sourceUrl:
          "http://foodandspice.blogspot.com/2016/08/spicy-black-eyed-pea-curry-with-swiss.html",
      image:
          "spicy-black-eyed-pea-curry-with-swiss-chard-and-roasted-eggplant-798400.jpg",
      servings: 6,
      id: 798400,
      title: "Spicy Black-Eyed Pea Curry with Swiss Chard and Roasted Eggplant",
    ),
    CategoryEntity(
      readyInMinutes: 45,
      sourceUrl:
          "http://foodandspice.blogspot.com/2016/08/spicy-black-eyed-pea-curry-with-swiss.html",
      image:
          "spicy-black-eyed-pea-curry-with-swiss-chard-and-roasted-eggplant-798400.jpg",
      servings: 6,
      id: 798400,
      title: "Spicy Black-Eyed Pea Curry with Swiss Chard and Roasted Eggplant",
    ),
    CategoryEntity(
      readyInMinutes: 45,
      sourceUrl:
          "http://foodandspice.blogspot.com/2016/08/spicy-black-eyed-pea-curry-with-swiss.html",
      image:
          "spicy-black-eyed-pea-curry-with-swiss-chard-and-roasted-eggplant-798400.jpg",
      servings: 6,
      id: 798400,
      title: "Spicy Black-Eyed Pea Curry with Swiss Chard and Roasted Eggplant",
    )
  ];

  static List<RecommendRecipeEntity> recommendedItems = const [
    RecommendRecipeEntity(
      id: 9751,
      title: "Dinner Tonight: Roasted Beet Bruschetta",
      imageType: "jpg",
      readyInMinutes: 45,
      servings: 4,
      sourceUrl:
          "http://www.seriouseats.com/recipes/2007/08/dinner-tonight-roasted-beet-bruschetta.html",
    ),
    RecommendRecipeEntity(
      id: 9751,
      title: "Dinner Tonight: Roasted Beet Bruschetta",
      imageType: "jpg",
      readyInMinutes: 45,
      servings: 4,
      sourceUrl:
          "http://www.seriouseats.com/recipes/2007/08/dinner-tonight-roasted-beet-bruschetta.html",
    ),
    RecommendRecipeEntity(
      id: 9751,
      title: "Dinner Tonight: Roasted Beet Bruschetta",
      imageType: "jpg",
      readyInMinutes: 45,
      servings: 4,
      sourceUrl:
          "http://www.seriouseats.com/recipes/2007/08/dinner-tonight-roasted-beet-bruschetta.html",
    ),
  ];
}
