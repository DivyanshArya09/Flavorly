import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/search_bar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: const BoxConstraints(maxWidth: 1200),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text('Search Menu Recipe',
                        style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomSearchBar(
                      text: 'Find Recipe',
                      onSubmitted: (String value) {},
                    ),
                  ],
                ),
              ),
              //  SilverLis
            ],
          ),
        ),
      ),
    );
  }
}
