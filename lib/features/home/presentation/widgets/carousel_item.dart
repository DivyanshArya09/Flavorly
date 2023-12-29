import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/config/constants/font_sizes.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

class CarouselItem extends StatelessWidget {
  final String title, imageUrl;
  final VoidCallback onTap;
  const CarouselItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: size.height * .28,
            width: size.width * .68,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imageProvider,
                          // filterQuality:
                        ),
                      ),
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const SkeltonContainer(
                      height: double.infinity,
                      width: double.infinity,
                      radius: 20,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black26.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: AppColors.buttonColor1,
                    size: size.width > 500 ? largeFontSize : size.width * .06,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: SizedBox(
                    width: size.width * .68 / 1.2,
                    child: Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: size.width > 500
                                    ? largeFontSize
                                    : size.width * .038,
                                color: AppColors.white,
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
