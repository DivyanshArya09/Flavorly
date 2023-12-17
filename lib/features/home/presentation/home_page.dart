import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/constants/padding.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/sign_out_bloc/sign_out_bloc.dart';
import 'package:recipe_app/features/auth/presentation/pages/sign_in.dart';
import 'package:recipe_app/features/home/components/caresoul.dart';
import 'package:recipe_app/features/home/components/categories_list.dart';
import 'package:recipe_app/features/home/components/cusines_list.dart';
import 'package:recipe_app/features/home/components/grid_view.dart';
import 'package:recipe_app/features/home/components/header.dart';
import 'package:recipe_app/features/home/components/recommendation.dart';
import 'package:recipe_app/features/home/components/search_bar.dart';
import 'package:recipe_app/features/home/widgets/cusine_tile.dart';
import 'package:recipe_app/features/home/widgets/custom_row.dart';
import 'package:recipe_app/features/home/widgets/grid_item.dart';
import 'package:recipe_app/features/home/widgets/seprator.dart';

import '../../../config/constants/app_colors.dart';

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
        // appBar: AppBar(
        //   backgroundColor: AppColors.buttonColor1,
        //   title: Responsive.isTablet(context)
        //       ? const Text('Tablet')
        //       : const Text('Mobile'),
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //     backgroundColor: AppColors.buttonColor1,
        //     currentIndex: 1,
        //     onTap: (value) {},
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.person),
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.settings),
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.logout),
        //       ),
        //     ]),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  size.width > 850 ? size.width * .13 : horizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(name: 'Anne'),
                const CustomSeperator(),
                const CustomSearchBar(),
                const CustomSeperator(),
                const CustomRow(text: 'Categories'),
                const CustomSeperator(),
                SizedBox(
                  height: size.height * .1,
                  child: const Categories(),
                ),
                const CustomSeperator(),
                const CustomRow(text: 'Recommendation'),
                SizedBox(
                  height: Responsive.isTablet(context)
                      ? size.height * .23
                      : size.height * .34,
                  child: const RecommendedItems(),
                ),
                const CustomRow(text: 'Popular'),
                const CustomSeperator(),
                Visibility(
                  visible: !Responsive.isDesktop(context),
                  child: const Carousel(),
                ),
                Visibility(
                  visible: Responsive.isDesktop(context),
                  child: SizedBox(
                    height: Responsive.isTablet(context)
                        ? size.height * .23
                        : size.height * .34,
                    // : size.height * .34,
                    child: const RecommendedItems(),
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
