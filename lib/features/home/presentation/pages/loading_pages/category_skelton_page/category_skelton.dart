import 'package:flutter/material.dart';
import 'package:Flavorly/config/utils/responsive.dart';
import 'package:Flavorly/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

class SkeltonRecipeGridBuilder extends StatelessWidget {
  const SkeltonRecipeGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: Responsive.isMobile(context) ? 1.5 : 1.2,
          crossAxisCount: Responsive.isMobile(context) ? 1 : 3),
      itemCount: 10,
      itemBuilder: (context, idx) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: SkeltonContainer(height: 100, width: 100, radius: 10),
        );
      },
    );
  }
}
