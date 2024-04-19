import 'package:flutter/material.dart';
import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/config/constants/nutrients_constants/nutrient_constants.dart';
import 'package:Flavorly/features/home/presentation/nutrient_page_bloc/bloc/nutrient_bloc.dart';

class FilterDialogBox extends StatefulWidget {
  final NutrientBloc nutrientBloc;
  const FilterDialogBox({super.key, required this.nutrientBloc});

  @override
  State<FilterDialogBox> createState() => _FilterDialogBoxState();
}

class _FilterDialogBoxState extends State<FilterDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.buttonColor1),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.all(AppColors.buttonColor1),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                // NutrientsConstants.selectedList = [];
              },
              child: const Text('cancel'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.buttonColor1),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.all(AppColors.buttonColor1),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                widget.nutrientBloc.add(
                  NutrientInitialEvent(
                      nutrients: NutrientsConstants.selectedList),
                );
                Navigator.pop(context);
                // print('-----------------------------------------> $values');
              },
              child: const Text('Apply'),
            ),
          ),
        ],
        insetPadding: const EdgeInsets.all(0),
        // titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.only(top: 10),
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: <Widget>[
                for (var i = 0; i < NutrientsConstants.allNutrients.length; i++)
                  FilterChip(
                    selectedColor: AppColors.buttonColor1,
                    label: Text(NutrientsConstants.allNutrients[i].name),
                    onSelected: (value) => setState(
                      () {
                        NutrientsConstants.values[i] =
                            !NutrientsConstants.values[i];
                        if (NutrientsConstants.selectedList
                            .contains(NutrientsConstants.allNutrients[i])) {
                          NutrientsConstants.selectedList
                              .remove(NutrientsConstants.allNutrients[i]);
                        } else {
                          NutrientsConstants.selectedList
                              .add(NutrientsConstants.allNutrients[i]);
                        }
                      },
                    ),
                    selected: NutrientsConstants.values[i],
                  ),
              ],
            ),
          ),
        ));
  }
}
