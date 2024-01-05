import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/config/constants/nutrients_constants/nutrient_constants.dart';

class FilterDialogBox extends StatefulWidget {
  const FilterDialogBox({super.key});

  @override
  State<FilterDialogBox> createState() => _FilterDialogBoxState();
}

class _FilterDialogBoxState extends State<FilterDialogBox> {
  List<bool> values =
      List<bool>.generate(NutrientsConstants.allNutrients.length, (i) => false);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                  overlayColor:
                      MaterialStateProperty.all(AppColors.buttonColor1),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
              onPressed: () {
                Navigator.pop(context);
                NutrientsConstants.selectedList = [];
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
                  overlayColor:
                      MaterialStateProperty.all(AppColors.buttonColor1),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
              onPressed: () {
                print(NutrientsConstants.selectedList);
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
        content: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: <Widget>[
            for (var i = 0; i < NutrientsConstants.allNutrients.length; i++)
              FilterChip(
                selectedColor: AppColors.buttonColor1,
                label: Text(NutrientsConstants.allNutrients[i].name),
                onSelected: (value) => setState(
                  () {
                    values[i] = !values[i];
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
                selected: values[i],
              ),
          ],
        ));
  }
}
