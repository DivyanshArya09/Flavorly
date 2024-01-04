import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/config/theme/theme.dart';
import 'package:recipe_app/config/utils/responsive.dart';
import 'package:recipe_app/core/shared/dialog_box.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/responsive/dekstop_detail_page.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/get_instructions_page.dart';
import 'package:recipe_app/features/home/presentation/pages/detail_page/recipe_detail_page.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page/home_page.dart';
// import 'package:recipe_app/features/home/presentation/pages/detail_page/recipe_detail_page.dart';
// import 'package:recipe_app/features/home/presentation/pages/home_page/home_page.dart';
import 'package:recipe_app/firebase_options.dart';
import 'features/onBoardingScreen/presentation/bloc/animation_bloc.dart';
import 'injection_container/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnimationBloc>(
          create: (context) => AnimationBloc(),
        ),
        // BlocProvider<AuthBloc>(
        //     create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
        // BlocProvider<SignOutBloc>(create: (context) => di.sl<SignOutBloc>()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: const HomePage(name: 'anne'),
        // home: Responsive.buildResponsive(
        //     mobile: const RecipeDetailPage(),
        //     desktop: const DekStopDetailLayout()),
        // home: BlocBuilder<AuthBloc, AuthState>(
        //   builder: (context, state) {
        //     if (state is Authenticated) {
        //       return HomePage(
        //         name: state.name,
        //         email: state.email,
        //         uid: state.uid,
        //       );
        //     }
        //     if (state is Unauthenticated) {
        //       return const SignUpPage();
        //     }
        //     if (state is AuthLoading) {
        //       return const Scaffold(
        //         body: Center(
        //           child: CircularProgressIndicator(
        //             color: AppColors.buttonColor1,
        //           ),
        //         ),
        //       );
        //     }
        //     if (state is AppFirstTimeOpened) {
        //       return const OnBoardingScreen();
        //     }
        //     return const Scaffold(
        //       body: Center(
        //         child: CircularProgressIndicator(
        //           color: AppColors.buttonColor1,
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
