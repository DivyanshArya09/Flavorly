import 'package:equatable/equatable.dart';

class MenuRecipeEntity extends Equatable {
  final String? sId;
  final int? id;
  final String? title;
  final String? image;
  final String? imageType;
  final String? restaurantChain;
  final Servings? servings;

  const MenuRecipeEntity(
      {this.sId,
      this.id,
      this.title,
      this.image,
      this.imageType,
      this.restaurantChain,
      this.servings});

  @override
  List<Object?> get props =>
      [sId, id, title, image, imageType, restaurantChain, servings];
}

class Servings extends Equatable {
  final double? number;
  final double? size;
  final String? unit;

  const Servings({this.number, this.size, this.unit});

  @override
  List<Object?> get props => [
        number,
        size,
      ];
}
