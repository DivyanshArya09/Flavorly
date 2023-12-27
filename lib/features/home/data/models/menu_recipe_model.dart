import '../../domain/entites/menu_recipe_entiry.dart';

class MenuRecipeModel extends MenuRecipeEntity {
  const MenuRecipeModel(
      {required super.sId,
      required super.id,
      required super.title,
      required super.image,
      required super.imageType,
      required super.restaurantChain,
      required super.servings});

  factory MenuRecipeModel.fromJson(Map<String, dynamic> json) {
    return MenuRecipeModel(
      sId: json['_id'],
      id: json['id'],
      title: json['title'],
      image: json['image'],
      imageType: json['imageType'],
      restaurantChain: json['restaurantChain'],
      servings: ServingModel.fromJson(json['servings']),
    );
  }
}

class ServingModel extends Servings {
  const ServingModel({required super.number, required super.size});
  factory ServingModel.fromJson(Map<String, dynamic> json) {
    return ServingModel(number: json['number'], size: json['size']);
  }
}
