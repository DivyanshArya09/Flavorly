import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/core/shared/dialog_box.dart';
import 'package:recipe_app/features/home/presentation/detail_page_bloc/bloc/recipe_detail_bloc.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/get_instructions_page.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/widgets/recipe_over_view.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

class RecipeDetailPage extends StatefulWidget {
  final int id;
  const RecipeDetailPage({super.key, required this.id});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  late RecipeDetailBloc recipeDetailBloc;

  @override
  void initState() {
    super.initState();
    recipeDetailBloc = GetIt.I.get<RecipeDetailBloc>();
    recipeDetailBloc.add(GetRecipeDetailEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<RecipeDetailBloc, RecipeDetailState>(
      bloc: recipeDetailBloc,
      listener: (context, state) {
        if (state.failure == RecipeDetailFailure.connection ||
            state.failure == RecipeDetailFailure.server) {
          openDialog(context);
        }
      },
      builder: (context, state) {
        if (state.status == RecipeDetailStatus.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state.status == RecipeDetailStatus.success) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: AppColors.buttonColor1,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetInstructions(
                      steps:
                          state.recipeDetail?.analyzedInstructions![0].steps ??
                              [],
                    ),
                  ),
                );
              },
              label: const Text(
                'Get Instructions',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ).animate().scaleXY(
                  duration: const Duration(milliseconds: 500),
                  begin: 0,
                  end: 1,
                ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: CustomScrollView(
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
                      icon: const Icon(Icons.arrow_back_ios_new_outlined,
                          size: 20),
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
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: CachedNetworkImage(
                          imageUrl: state.recipeDetail!.image!,
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const SkeltonContainer(
                            height: double.infinity,
                            width: double.infinity,
                            radius: 20,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
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
                      RecipeOverView(
                        title: state.recipeDetail?.title ?? '',
                        timeToCook:
                            state.recipeDetail?.readyInMinutes.toString() ??
                                '0',
                        healthScore:
                            state.recipeDetail?.healthScore.toString() ?? '0',
                        likes: state.recipeDetail?.aggregateLikes.toString() ??
                            '0',
                        ingredients:
                            state.recipeDetail?.extendedIngredients ?? [],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
