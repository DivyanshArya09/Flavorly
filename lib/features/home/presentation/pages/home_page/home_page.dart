import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/constants/nutrients_constants/nutrient_constants.dart';
import 'package:recipe_app/config/constants/padding.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/core/shared/dialog_box.dart';
import 'package:recipe_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:recipe_app/features/home/presentation/pages/category_page/Category_page.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/caresoul.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/categories_list.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/grid_view.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/header.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recipe_card_list.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recommendation.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/search_bar.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_home_page.dart';
import 'package:recipe_app/features/home/presentation/pages/nutrient_page/nutrient_page.dart';
import 'package:recipe_app/features/home/presentation/widgets/custom_row.dart';
import 'package:recipe_app/features/home/presentation/widgets/seprator.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({
    super.key,
    required this.name,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  final _searchTC = TextEditingController();
  @override
  void dispose() {
    _searchTC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    homeBloc = GetIt.I.get<HomeBloc>()
      ..add(HomeInitialEvent(
          category: 'indian',
          id: 4673,
          menuItem: 'pizza',
          numberOfMenuItemsYouWant: 10,
          nutrients: [
            NutrientsConstants.allNutrients[0],
          ]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // final bloc = GetIt.I.get<SignOutBloc>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: BlocConsumer<HomeBloc, HomeState>(
              bloc: homeBloc,
              listener: (context, state) {
                if (state.failure == Failure.connection) {
                  openDialog(context);
                }
              },
              // buildWhen:  ( previous, current) => current is H,
              builder: (context, state) {
                if (state.status == HomeStatus.loading) {
                  return SkeltonHomePage(
                    name: widget.name,
                  );
                }
                if (state.status == HomeStatus.success) {
                  return SingleChildScrollView(
                    key: const Key('homePageWithRecipeData'),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Header(name: widget.name),
                        const CustomSeperator(),
                        CustomSearchBar(
                          controller: _searchTC,
                          text: 'Search Recipes',
                          onSubmitted: (p0) {
                            if (p0.isNotEmpty) {
                              _searchTC.clear();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryPage(
                                    category: p0,
                                    title: 'Search Recipes',
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        const CustomSeperator(),
                        //! implementation id pending
                        CustomRow(
                          isSeeAll: true,
                          text: 'Categories',
                          onTap: () {},
                        ),
                        const CustomSeperator(),
                        const SizedBox(
                          height: 90,
                          child: Categories(),
                        ),
                        const CustomSeperator(),
                        CustomRow(
                          text: 'By Nutrients',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NutrientPage()));
                          },
                        ),
                        SizedBox(
                            height: Responsive.isMobile(context)
                                ? size.height * .38
                                : 250,
                            child: NutrientRecipes(
                              nutrientRecipes: state.nutrients ?? [],
                            )),

                        //! implementation id pending
                        CustomRow(
                          text: 'Menu Items',
                          isSeeAll: true,
                          onTap: () {},
                        ),
                        const CustomSeperator(),
                        Visibility(
                          visible: !Responsive.isDesktop(context),
                          child: Carousel(
                            menuItems: state.menuItems ?? [],
                          ),
                        ),
                        Visibility(
                          visible: Responsive.isDesktop(context),
                          child: SizedBox(
                            height: 230,
                            child: NutrientRecipes(
                              nutrientRecipes: state.nutrients ?? [],
                            ),
                          ),
                        ),
                        CustomRow(
                          text: 'Cusines',
                          onTap: () {},
                          isSeeAll: true,
                        ),
                        const CustomSeperator(),
                        RecipeCardList(
                          recipes: state.categories ?? [],
                        ),
                        Visibility(
                          visible: Responsive.isDesktop(context),
                          child: const MyGrid(),
                        )
                      ],
                    ),
                  );
                }
                return SkeltonHomePage(
                  name: widget.name,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/*Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Welcome $name'),
        Text('Email: $email'),
        Text('UID: $uid'),
        BlocConsumer<SignOutBloc, SignOutState>(
          bloc: bloc,
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                bloc.add(SignOutButtonPressed());
              },
              child: const Text('Logout'),
            );
          },
          listener: (BuildContext context, SignOutState state) {
            if (state is SignOutLoaded) {
              Navigator.pop(context);
            }

            if (state is SignOutServerFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
            if (state is SignOutLoaded) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ));
            }

            if (state is SignOutLoading) {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }
          },
        )
      ])),
    ); */
