import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/core/shared/dialog_box.dart';
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart';
import 'package:recipe_app/features/home/presentation/category_page_bloc/bloc/category_bloc.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/search_bar.dart';
import 'package:recipe_app/features/home/presentation/pages/category_page/widgets/recipe_gridBuilder.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/category_skelton_page/category_skelton_page.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  final String? title;
  const CategoryPage({super.key, required this.category, this.title});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late CategoryBloc categoryBloc;
  late TextEditingController controller;
  @override
  void initState() {
    categoryBloc = GetIt.I.get<CategoryBloc>()
      ..add(GetCategoryEvent(category: widget.category));

    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocConsumer<CategoryBloc, CategoryState>(
            bloc: categoryBloc,
            listener: (context, state) {
              if (state.failure == CategoryFailure.connection) {
                openDialog(context);
              }
              if (state.failure == CategoryFailure.server) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Server Error'),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state.status == CategoryStatus.success) {
                return Container(
                  constraints: const BoxConstraints(
                    maxWidth: 1200,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(
                      top: 10,
                      left: !Responsive.isMobile(context) ? 80 : 0,
                      right: !Responsive.isMobile(context) ? 80 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title ?? 'Search Categories',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? double.infinity
                            : size.width / 2.5,
                        child: CustomSearchBar(
                          text: 'search any recipes',
                          controller: controller,
                          onSubmitted: (value) {
                            categoryBloc.add(
                                SearchCategoriesEvent(query: controller.text));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Results for ${state.category}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Expanded(
                        child: RecipeGridBuilder(
                          categoryList:
                              state.categoryResults as List<CategoryEntity>,
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state.status == CategoryStatus.loading) {
                return SkeltonCategoryPage(category: widget.category);
              }
              return const Center(
                child: Text('OOps Something went wrong'),
              );
            },
          ),
        ),
      ),
    );
  }
}
