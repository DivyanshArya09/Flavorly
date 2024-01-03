import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/steps_page.dart';

class GetInstructions extends StatelessWidget {
  const GetInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
            margin: const EdgeInsets.only(top: 40),
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const SingleChildScrollView(child: StepsPage());
              },
            ),
          ),
        ),
      ),
    );
  }
}
