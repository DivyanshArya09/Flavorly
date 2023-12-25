import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.image,
    required super.sourceUrl,
    required super.servings,
    required super.readyInMinutes,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      sourceUrl: json['sourceUrl'],
      servings: json['servings'],
      readyInMinutes: json['readyInMinutes'],
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, title: title, image: image);
  }
}
