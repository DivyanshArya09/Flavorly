import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

class SkeltonGrid extends StatelessWidget {
  const SkeltonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (_, index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: SkeltonContainer(height: 250, width: 300, radius: 20),
      ),
    );
  }
}
