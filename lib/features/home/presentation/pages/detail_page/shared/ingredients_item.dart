import 'package:flutter/material.dart';

class RecipeIngredientsAndEquipmentWidget extends StatelessWidget {
  final String title, imageUrl;
  const RecipeIngredientsAndEquipmentWidget(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(fit: BoxFit.fill, image: NetworkImage(imageUrl)),
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
