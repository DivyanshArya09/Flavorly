import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

class ExtendedIngredientTile extends StatelessWidget {
  final String imageUrl, name, aisle, unitShort, unit, amount, consistency;
  const ExtendedIngredientTile(
      {super.key,
      required this.amount,
      required this.consistency,
      required this.name,
      required this.aisle,
      required this.unitShort,
      required this.unit,
      required this.imageUrl});

  // const ExtendedIngredientTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      constraints: const BoxConstraints(
        // maxHeight: 200,
        maxWidth: 700,
      ),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CachedNetworkImage(
              imageUrl:
                  'https://spoonacular.com/cdn/ingredients_100x100/$imageUrl',
              fit: BoxFit.contain,
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
                height: 100,
                width: 100,
                radius: 20,
              ),
              errorWidget: (context, url, error) =>
                  const Image(image: AssetImage('assets/halo-halo.png')),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                aisle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'measures : $amount $unitShort ',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                'consistency : $consistency ',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
