import 'package:flutter/material.dart';
import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/features/home/domain/entites/recipe_detail_entity.dart';
import 'package:Flavorly/features/home/presentation/pages/detail_page/steps_page.dart';

class GetInstructions extends StatelessWidget {
  final List<Steps> steps;
  const GetInstructions({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: AppColors.buttonColor1,
          unselectedItemColor: AppColors.buttonColor1,
          items: const [
            BottomNavigationBarItem(
              label: 'Prev Step',
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Next Step',
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
          onTap: (idx) {
            if (idx == 0) {
              pageController.previousPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut);
            } else {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut);
            }
          },
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: PageView.builder(
              controller: pageController,
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: StepsPage(
                    stepNumber: steps[index].number.toString(),
                    step: steps[index].step.toString(),
                    ingredients: steps[index].ingredients as List<Ingredients>,
                    equipment: steps[index].equipment as List<Equipment>,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
