import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:mockito/mockito.dart';
import 'package:recipe_app/injection_container/injection_container.dart'
    as locator;
// import 'package:recipe_app/injection_container/injection_container.dart';

import 'package:recipe_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/home_page.dart';
import 'package:recipe_app/features/home/presentation/pages/loading_pages/home_loading_page.dart/skelton_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_data.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

Widget makeTestableWidget(Widget child) {
  return BlocProvider(
    create: (context) => MockHomeBloc(),
    child: MaterialApp(
      home: child,
    ),
  );
}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() async {
    locator.sl.registerFactory<HomeBloc>(() => mockHomeBloc);
    mockHomeBloc = MockHomeBloc();
    HttpOverrides.global = null;
  });

  // tearDown(() {
  //   locator.sl.reset();
  // });

  Widget makeTestableWidget(Widget child) {
    return BlocProvider(
      create: (context) => mockHomeBloc,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('its should show skelton page while the data is loading',
      (widgetTester) async {
    // arrange
    when(() => mockHomeBloc.state)
        .thenReturn(const HomeState(status: HomeStatus.loading));

    // act
    await widgetTester.pumpWidget(makeTestableWidget(const HomePage(
      name: '',
    )));

    // assert
    expect(find.byType(SkeltonHomePage), findsOneWidget);
  });

  testWidgets('its should show home page with all the widgets',
      (widgetTester) async {
    // arrange
    when(() => mockHomeBloc.state).thenReturn(
      HomeState(
        categories: TestDataList.categories,
        status: HomeStatus.success,
        nutrients: TestDataList.nutrient,
        menuItems: TestDataList.menuItems,
        recommendedItems: TestDataList.recommendedItems,
      ),
    );

    print('------------------Before pumping------------------33');
    // act
    await widgetTester.pumpWidget(
        makeTestableWidget(
          const HomePage(
            name: '',
          ),
        ),
        const Duration(seconds: 5));

    print('------------------After pumping------------------');

    await widgetTester.pumpAndSettle(const Duration(seconds: 5));
    await widgetTester.pump();
    // assert
    expect(find.byType(SizedBox), findsWidgets);
  });
}
