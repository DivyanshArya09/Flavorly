import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/features/home/presentation/detail_page_bloc/bloc/recipe_detail_bloc.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/widgets/recipe_over_view.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.buttonColor1,
        onPressed: () {},
        label: const Text(
          'Get Instructions',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ).animate().scaleXY(
            duration: const Duration(milliseconds: 500),
            begin: 0,
            end: 1,
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocConsumer<RecipeDetailBloc, RecipeDetailState>(
        bloc: GetIt.I.get<RecipeDetailBloc>(),
        listener: (context, state) {},
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.arrow_back_ios_new_outlined, size: 20),
                  ),
                ),
                actions: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline_rounded,
                        size: 20,
                      ),
                    ),
                  ),
                ],
                stretch: true,
                elevation: 0,
                // pinned: true,
                expandedHeight: size.height * .35,
                flexibleSpace: Stack(
                  children: [
                    const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                          ),
                        )),
                    Positioned(
                      bottom: -1,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const RecipeOverView(),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
