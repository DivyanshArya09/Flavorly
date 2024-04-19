import 'package:flutter/material.dart';
import 'package:Flavorly/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

import '../../../../../../../config/utils/responsive.dart';

class CategoriesSkelton extends StatelessWidget {
  const CategoriesSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
          child: SkeltonContainer(
            height:
                Responsive.isTablet(context) || Responsive.isDesktop(context)
                    ? 120
                    : size.height * .09,
            width: Responsive.isTablet(context) || Responsive.isDesktop(context)
                ? 150
                : size.width * .2,
            radius: 10,
          ),
        );
      },
    );
  }
}
