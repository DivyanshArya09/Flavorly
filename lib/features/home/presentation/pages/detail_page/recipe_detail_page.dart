import 'package:flutter/material.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/components/recipe_card.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.buttonColor1,
        onPressed: () {}, label: const Text('Like bdsjdsjkbdskjbjdksb'),
        // isExtended: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
              ),
            ],
            stretch: true,
            elevation: 0,
            // pinned: true,
            expandedHeight: size.height * .35,
            flexibleSpace: const FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: const Column(children: [
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
                Text(
                  'Recipe Title',
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent =>
      50.0; // Minimum height of the header when it's not expanded

  @override
  double get maxExtent =>
      100.0; // Maximum height of the header when it's fully expanded

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Build your persistent header widget here
    return Container(
      color: Colors.blue,
      alignment: Alignment.bottomCenter,
      child: Expanded(
        child: SliverList(
            delegate: SliverChildListDelegate([
          RecipeCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
              title: 'title',
              onTap: () {},
              readyInMinutes: '20'),
          RecipeCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
              title: 'title',
              onTap: () {},
              readyInMinutes: '20'),
          RecipeCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
              title: 'title',
              onTap: () {},
              readyInMinutes: '20'),
          RecipeCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
              title: 'title',
              onTap: () {},
              readyInMinutes: '20'),
          RecipeCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
              title: 'title',
              onTap: () {},
              readyInMinutes: '20'),
          RecipeCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
              title: 'title',
              onTap: () {},
              readyInMinutes: '20'),
          RecipeCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
              title: 'title',
              onTap: () {},
              readyInMinutes: '20'),
          RecipeCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
              title: 'title',
              onTap: () {},
              readyInMinutes: '20'),
        ])),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // Only rebuild if necessary (e.g., when parameters change)
  }
/*
 SliverList(
              delegate: SliverChildListDelegate([
            RecipeCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
                title: 'title',
                onTap: () {},
                readyInMinutes: '20'),
            RecipeCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
                title: 'title',
                onTap: () {},
                readyInMinutes: '20'),
            RecipeCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
                title: 'title',
                onTap: () {},
                readyInMinutes: '20'),
            RecipeCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
                title: 'title',
                onTap: () {},
                readyInMinutes: '20'),
            RecipeCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
                title: 'title',
                onTap: () {},
                readyInMinutes: '20'),
            RecipeCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
                title: 'title',
                onTap: () {},
                readyInMinutes: '20'),
            RecipeCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
                title: 'title',
                onTap: () {},
                readyInMinutes: '20'),
            RecipeCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
                title: 'title',
                onTap: () {},
                readyInMinutes: '20'),
          ])),
          

*/
}
