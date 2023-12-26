class ApiUrls {
  static const apiKey = '2c1b0e52091f4f3696b5642181e5d4b6';
  static const baseUrl = 'https://api.spoonacular.com';

  static String getCategoriesRecipeUrl(String category, int number) =>
      '$baseUrl/recipes/search?apiKey=$apiKey&number=$number&cuisine=$category';

  static String getRecipeByNutrientsUrl(
      List<String> nutrients, int concentration) {
    String query = '';
    for (var element in nutrients) {
      query += '&$element=$concentration';
    }
    query = query.replaceAll(
      ',',
      '',
    );
    return '$baseUrl/recipes/findByNutrients?apiKey=$apiKey$query';
  }

  static String getRandomRecipesUrl(int number) =>
      '$baseUrl/recipes/random?apiKey=$apiKey&number=$number';

  static String getRecommendedRecipesUrl(int id) =>
      '$baseUrl/recipes/$id/similar?apiKey=$apiKey';

// popular = https://api.spoonacular.com/recipes/search?apiKey=2c1b0e52091f4f3696b5642181e5d4b6&number=10&cuisine=indian
// byNurtrients = https://api.spoonacular.com/recipes/findByNutrients?minCarbs=10&maxCarbs=50&number=2
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
