import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/skelton_containers_height_widths/skelton_containers_constants.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

import '../../../../../../../config/utils/responsive.dart';

class RecommendedRecipesSkelton extends StatelessWidget {
  const RecommendedRecipesSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeltonContainer(
                height: !Responsive.isMobile(context) ? 150 : size.height * .25,
                width: !Responsive.isMobile(context) ? 220 : size.width * .38,
                radius: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child: SkeltonContainer(
                    height: SkeltonConfigs.textHeight,
                    width: !Responsive.isMobile(context)
                        ? 220 / 2
                        : size.width * .38 / 2,
                    radius: 10),
              ),
              SkeltonContainer(
                  height: SkeltonConfigs.textHeight,
                  width: !Responsive.isMobile(context)
                      ? 220 / 3
                      : size.width * .38 / 3,
                  radius: 10),
            ],
          ),
        );
      },
    );
  }
}
