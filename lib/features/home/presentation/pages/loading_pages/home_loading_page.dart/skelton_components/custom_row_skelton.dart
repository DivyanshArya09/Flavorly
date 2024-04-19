import 'package:flutter/material.dart';
import 'package:Flavorly/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

class CustomRowSkelton extends StatelessWidget {
  const CustomRowSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SkeltonContainer(height: 13, width: size.width * .3, radius: 10),
        SkeltonContainer(height: 13, width: size.width * .15, radius: 10),
      ],
    );
  }
}
