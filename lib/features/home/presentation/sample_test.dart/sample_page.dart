import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/features/home/data/data_sources/remote/remote_data_source_impl.dart';

class TestApiPage extends StatefulWidget {
  const TestApiPage({super.key});

  @override
  State<TestApiPage> createState() => _TestApiPageState();
}

class _TestApiPageState extends State<TestApiPage> {
  HomeRemoteDataSourceImpl homeRemoteDataSourceImpl =
      HomeRemoteDataSourceImpl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            homeRemoteDataSourceImpl.getCategoriesOfRecipes('indian');
          },
          child: const Text('make Api call'),
        ),
      ),
    );
  }
}
