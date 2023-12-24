import 'package:recipe_app/features/home/domain/entites/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, title: title, image: image);
  }
}
