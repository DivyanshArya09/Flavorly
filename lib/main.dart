import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/config/theme/theme.dart';
import 'package:Flavorly/features/auth/presentation/auth_blocs/auth_bloc/auth_bloc.dart';
import 'package:Flavorly/features/auth/presentation/pages/sign_in.dart';
import 'package:Flavorly/features/home/presentation/pages/home_page/home_page.dart';
import 'package:Flavorly/features/onBoardingScreen/presentation/pages/pageview.dart';
import 'package:Flavorly/features/settings/presentation/bloc/theme_bloc.dart';
import 'package:Flavorly/firebase_options.dart';
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
        BlocProvider<AuthBloc>(
            create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
        BlocProvider<ThemeBloc>(
          create: (context) => di.sl<ThemeBloc>()
            ..add(
              const GetThemeFromLocalStorage(),
            ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return _myApp(state.themeMode);
        },
      ),
    );
  }

  _myApp(ThemeMode mode) {
    return MaterialApp(
      themeMode: mode,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return HomePage(
              name: state.name,
            );
          }
          if (state is Unauthenticated) {
            return const SignUpPage();
          }
          if (state is AuthLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.buttonColor1,
                ),
              ),
            );
          }
          if (state is AppFirstTimeOpened) {
            return const OnBoardingScreen();
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.buttonColor1,
              ),
            ),
          );
        },
      ),
    );
  }
}
