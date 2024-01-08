import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/constants/nutrients_constants/nutrient_constants.dart';
import 'package:recipe_app/core/shared/dialog_box.dart';
import 'package:recipe_app/features/home/presentation/nutrient_page_bloc/bloc/nutrient_bloc.dart';
import 'package:recipe_app/features/home/presentation/pages/nutrient_page/widgets/filter_dialog_box.dart';
import 'package:recipe_app/features/home/presentation/pages/nutrient_page/widgets/nutrient_recipe_card.dart';

class NutrientPage extends StatefulWidget {
  const NutrientPage({super.key});

  @override
  State<NutrientPage> createState() => _NutrientPageState();
}

class _NutrientPageState extends State<NutrientPage> {
  late NutrientBloc nutrientBloc;
  @override
  void initState() {
    nutrientBloc = GetIt.I.get<NutrientBloc>()
      ..add(NutrientInitialEvent(nutrients: [
        NutrientsConstants.allNutrients[0],
      ]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<NutrientBloc, NutrientState>(
          bloc: nutrientBloc,
          listener: (context, state) {
            if (state.failure == NutrientFailure.connection ||
                state.failure == NutrientFailure.server) {
              print(
                  '================================================>>>>>>>>${state.failure}');
              openDialog(context);
            }
          },
          builder: (context, state) {
            if (state.status == NutrientStatus.success) {
              return Container(
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
                              onPressed: () {
                                // NutrientsConstants.selectedList.clear();
                                showDialog(
                                    context: context,
                                    builder: (context) => FilterDialogBox(
                                        nutrientBloc: nutrientBloc));
                              },
                              icon: const Icon(Icons.filter_alt_sharp),
                            ),
                          ),
                          Center(
                              child: Text('add filters',
                                  style:
                                      Theme.of(context).textTheme.titleSmall)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              NutrientsConstants.selectedList.isEmpty
                                  ? 'No filters selected'
                                  : NutrientsConstants.selectedList
                                      .map((e) => e.name)
                                      .join(', '),
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    NutrientRecipeCard(
                      nutrientRecipes: state.nutrientResults ?? [],
                    ),
                  ],
                ),
              );
            }

            if (state.status == NutrientStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
      ),
    );
  }
}

// void onPressed() {
void onPressed(BuildContext context, {required NutrientBloc nutrientBloc}) {
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
            content: FilterDialogBox(
              nutrientBloc: nutrientBloc,
            ),
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