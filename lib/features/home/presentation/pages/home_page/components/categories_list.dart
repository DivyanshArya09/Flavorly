import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/widgets/single_category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
          child: const Category(),
        );
      },
    );
  }
}
