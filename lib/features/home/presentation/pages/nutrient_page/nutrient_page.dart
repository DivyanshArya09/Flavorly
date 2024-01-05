import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/pages/nutrient_page/widgets/filter_dialog_box.dart';
import 'package:recipe_app/features/home/presentation/pages/nutrient_page/widgets/nutrient_recipe_card.dart';

class NutrientPage extends StatelessWidget {
  const NutrientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: const BoxConstraints(maxWidth: 1200),
          margin: const EdgeInsets.only(top: 30),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get Recipes based on Nutrients',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: IconButton(
                        onPressed: () => onPressed(context),
                        icon: const Icon(Icons.filter_alt_sharp),
                      ),
                    ),
                    Center(
                        child: Text('add filters',
                            style: Theme.of(context).textTheme.titleSmall)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('No filters selected',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const NutrientRecipeCard(),
            ],
          ),
        ),
      ),
    );
  }
}

// void onPressed() {
void onPressed(BuildContext context) {
  showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            title: const FilterDialogBox(),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
  );
}
// }
// }




/**
 * 
 *  SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get Recipes based on Nutrients',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: IconButton(
                  onPressed: () {
                    onPressed(context);
                  },
                  icon: const Icon(Icons.filter_alt_sharp),
                ),
              ),
              Center(
                  child: Text('add filters',
                      style: Theme.of(context).textTheme.titleSmall)),
              const SizedBox(
                height: 10,
              ),
              Text('No filters selected',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: const NutrientRecipeCard()),
            ],
          ),
        ),
      ),
    
    
 */