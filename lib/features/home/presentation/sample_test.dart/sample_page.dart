// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:recipe_app/features/home/data/data_sources/remote/remote_data_source_impl.dart';
// import 'package:recipe_app/features/home/data/models/category_model.dart';
// import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_container.dart';

// class TestApiPage extends StatefulWidget {
//   const TestApiPage({super.key});

//   @override
//   State<TestApiPage> createState() => _TestApiPageState();
// }

// class _TestApiPageState extends State<TestApiPage> {
//   HomeRemoteDataSourceImpl homeRemoteDataSourceImpl =
//       HomeRemoteDataSourceImpl(dio: Dio());

//   List<CategoryModel> data = [];
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: Center(
//       child: SkeltonContainer(),
//     ));
//   }
// }

// // Column(
// //         children: [
// //           ElevatedButton(
// //             onPressed: () async {
// //               await homeRemoteDataSourceImpl
// //                   .getCategoriesOfRecipes('indian')
// //                   .then((value) {
// //                 setState(() {
// //                   data = value;
// //                   // print(data);
// //                 });
// //               });
// //             },
// //             child: const Text('make Api call'),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //                 itemCount: data.length,
// //                 itemBuilder: (context, index) {
// //                   return Text(data[index].title.toString());
// //                 }),
// //           )
// //         ],
// //       ),
   
   