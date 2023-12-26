import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/padding.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/caresoul.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/categories_list.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/cusines_list.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/grid_view.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/header.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recommendation.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/search_bar.dart';
import 'package:recipe_app/features/home/presentation/widgets/custom_row.dart';
import 'package:recipe_app/features/home/presentation/widgets/seprator.dart';

// 384 -> old mobiles
// 640 > normal mobiles
// 768 > tablets
// 1024 > large tabs
// 1280 > small comp
// 1536 > Desktop
// 4k > large desktop

class HomePage extends StatelessWidget {
  final String name;
  const HomePage({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final bloc = GetIt.I.get<SignOutBloc>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  size.width > 850 ? size.width * .13 : horizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Header(name: 'Anne'),
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
                const CustomRow(text: 'Recommendation'),
                SizedBox(
                    height:
                        Responsive.isMobile(context) ? size.height * .35 : 250,
                    child: const RecommendedItems()),
                const CustomRow(text: 'Popular'),
                const CustomSeperator(),
                Visibility(
                  visible: !Responsive.isDesktop(context),
                  child: const Carousel(),
                ),
                Visibility(
                  visible: Responsive.isDesktop(context),
                  child: const SizedBox(
                    height: 230,
                    // : size.height * .34,
                    child: RecommendedItems(),
                  ),
                ),
                const CustomRow(text: 'Cusines'),
                const CustomSeperator(),
                Visibility(
                    visible: !Responsive.isDesktop(context),
                    child: const CusinesList()),
                Visibility(
                  visible: Responsive.isDesktop(context),
                  child: const MyGrid(),
                )
              ],
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
