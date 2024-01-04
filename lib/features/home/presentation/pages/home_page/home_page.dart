import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/constants/padding.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/caresoul.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/categories_list.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/grid_view.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/header.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recipe_card_list.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recommendation.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/search_bar.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_home_page.dart';
import 'package:recipe_app/features/home/presentation/widgets/custom_row.dart';
import 'package:recipe_app/features/home/presentation/widgets/seprator.dart';

// 384 -> old mobiles
// 640 > normal mobiles
// 768 > tablets
// 1024 > large tabs
// 1280 > small comp
// 1536 > Desktop
// 4k > large desktop

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

  @override
  void initState() {
    homeBloc = GetIt.I.get<HomeBloc>()
      ..add(const HomeInitialEvent(
          category: 'indian',
          id: 4673,
          menuItem: 'pizza',
          numberOfMenuItemsYouWant: 10,
          nutrients: ['maxCarbs'],
          concentration: 20));
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
              listener: (context, state) {},
              // buildWhen:  ( previous, current) => current is H,
              builder: (context, state) {
                if (state.status == HomeStatus.loading) {
                  return const SkeltonHomePage();
                }
                if (state.status == HomeStatus.success) {
                  return SingleChildScrollView(
                    key: const Key('homePageWithRecipeData'),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Header(name: 'Divyansh'),
                        const CustomSeperator(),
                        const CustomSearchBar(),
                        const CustomSeperator(),
                        const CustomRow(text: 'Categories'),
                        const CustomSeperator(),
                        const SizedBox(
                          height: 90,
                          child: Categories(),
                        ),
                        const CustomSeperator(),
                        const CustomRow(text: 'By Nutrients'),
                        SizedBox(
                            height: Responsive.isMobile(context)
                                ? size.height * .38
                                : 250,
                            child: NutrientRecipes(
                              nutrientRecipes: state.nutrients ?? [],
                            )),
                        const CustomRow(text: 'Menu Items'),
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
                            // : size.height * .34,
                            child: NutrientRecipes(
                              nutrientRecipes: state.nutrients ?? [],
                            ),
                          ),
                        ),
                        const CustomRow(text: 'Cusines'),
                        const CustomSeperator(),
                        RecipeCardList(
                          recipes: state.categories ?? [],
                        ),
                        // Visibility(
                        //     visible: !Responsive.isDesktop(context),
                        //     child: const CusinesList()),
                        Visibility(
                          visible: Responsive.isDesktop(context),
                          child: const MyGrid(),
                        )
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
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
