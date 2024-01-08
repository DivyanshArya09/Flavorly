import 'package:recipe_app/config/constants/nutrients_constants/nutrient_constants.dart';
import 'package:recipe_app/config/constants/nutrients_constants/nutrient_model.dart';

class ApiUrls {
  static const apiKey = '2c1b0e52091f4f3696b5642181e5d4b6';
  static const baseUrl = 'https://api.spoonacular.com';

  static String getRecipesDetailUrl(int id) =>
      '$baseUrl/recipes/$id/information?apiKey=$apiKey';

  static String getCategoriesRecipeUrl(String category, int number) =>
      '$baseUrl/recipes/search?apiKey=$apiKey&number=$number&cuisine=$category';

  static String getRecipeByNutrientsUrl(List<NutrientModel> nutrients) {
    // List<NutrientModel> nutrients = NutrientsConstants.allNutrients;
    String query = '';
    for (var element in nutrients) {
      query += '&${element.name}=${element.unit}';
    }
    print('-------------------------------------->>>>>>>>>>>>>> $query');
    print(
        '-------------------------------------->>>>>>>>>>>>>> $baseUrl/recipes/findByNutrients?$query&number=5&apiKey=$apiKey');

    return '$baseUrl/recipes/findByNutrients?apiKey=$apiKey&number=5$query';
  }

  static String getRandomRecipesUrl(int number) =>
      '$baseUrl/recipes/random?apiKey=$apiKey&number=$number';

  static String getRecommendedRecipesUrl(int id) =>
      '$baseUrl/recipes/$id/similar?apiKey=$apiKey';

  static String getMenuRecipesUrl(String menuItem, int number) =>
      '$baseUrl/food/menuItems/search?apiKey=$apiKey&number=$number&query=$menuItem';

// popular = https://api.spoonacular.com/recipes/search?apiKey=2c1b0e52091f4f3696b5642181e5d4b6&number=10&cuisine=indian
// byNurtrients = https://api.spoonacular.com/recipes/findByNutrients?minCarbs=10&maxCarbs=50&number=2
// menuitems = https://api.spoonacular.com/food/menuItems/search?apiKey=2c1b0e52091f4f3696b5642181e5d4b6&query=pizza&number=5
  static List<String> categories = [
    "American",
    "Indian",
    "Italian",
    "Chinese",
    "Japanese",
    "Mexican",
    "French",
    "Spanish",
    "Thai",
    "Greek",
    "Mediterranean",
    "Middle Eastern",
    "Vietnamese",
    "Brazilian",
    "Argentinian",
    "African",
    "Caribbean",
    "Korean",
    "Turkish",
    "Russian",
    "Scandinavian",
    "Australian",
    "British",
    "Irish",
    "German",
  ];
}
