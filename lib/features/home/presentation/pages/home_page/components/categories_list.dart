import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/core/shared/dialog_box.dart';
import 'package:recipe_app/core/utils/category_constant.dart';
import 'package:recipe_app/features/home/presentation/pages/category_page/Category_page.dart';
import 'package:recipe_app/features/home/presentation/widgets/single_category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: CategoryConstants.categories.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            child: SlideAnimation(
              duration: const Duration(milliseconds: 500),
              // verticalOffset: 50.0,
              horizontalOffset: -50.0,
              child: FadeInAnimation(
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
                  child: Category(
                    onTap: () {
                      GetIt.I.get<NetworkInfo>().isConnected.then(
                        (value) {
                          if (!value) {
                            openDialog(context);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        category: CategoryConstants
                                            .categories[index])));
                          }
                        },
                      );
                    },
                    imageUrl: CategoryConstants.categorypngs[index],
                    title: CategoryConstants.categories[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// return Padding(
//             padding: EdgeInsets.only(
//                 top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
//             child: const Category(),
//           );
// ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: EdgeInsets.only(
//               top: 8, bottom: 8, left: index == 0 ? 0 : 10, right: 10),
//           child: const Category(),
//         );
//       },
//     );