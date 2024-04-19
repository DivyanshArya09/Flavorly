import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/config/constants/font_sizes.dart';
import 'package:Flavorly/config/utils/responsive.dart';
import 'package:Flavorly/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

class RecommendedDish extends StatelessWidget {
  final String title, imageUrl;
  final VoidCallback onTap;
  const RecommendedDish(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: Responsive.isMobile(context) ? size.width * .38 : 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: !Responsive.isMobile(context) ? 150 : size.height * .25,
              width: !Responsive.isMobile(context) ? 220 : size.width * .4,
              decoration: const BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const SkeltonContainer(
                  height: double.infinity,
                  width: double.infinity,
                  radius: 20,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize:
                          size.width > 400 ? mediumFontSize : size.width * .045,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
