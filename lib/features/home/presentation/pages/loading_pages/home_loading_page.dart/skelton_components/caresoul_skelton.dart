import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

class CarouselSkelton extends StatelessWidget {
  const CarouselSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .23,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
            child: SkeltonContainer(
              height: size.height * .01,
              width: size.width * .68,
              radius: 20,
            ),
          );
        },
      ),
    );
  }
}
