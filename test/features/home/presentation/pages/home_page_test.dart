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
    mockHomeBloc = MockHomeBloc();
    SharedPreferences.setMockInitialValues({});
    await locator.init();
  });
  testWidgets(
    'its should show skelton page while the data is loading',
    (widgetTester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      // arrange

      when(() => mockHomeBloc.state).thenReturn(
        const HomeState(
          status: HomeStatus.loading,
        ),
      );

      await widgetTester.pumpWidget(
        makeTestableWidget(
          const HomePage(
            name: 'Divyansh',
          ),
        ),
      );

      // act
      // await widgetTester.pumpAndSettle();
      // await widgetTester.pump();

      // assert

      expect(find.byType(SkeltonHomePage), findsNothing);

      // expect(find.byType(SkeltonHomePage), findsOneWidget);
    },
  );
}
