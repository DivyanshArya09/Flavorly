import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/auth_bloc/auth_bloc.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/sign_out_bloc/sign_out_bloc.dart';
import 'package:recipe_app/features/auth/presentation/pages/sign_in.dart';
import 'package:recipe_app/features/home/presentation/home_page.dart';
import 'package:recipe_app/firebase_options.dart';
// import 'package:recipe_app/features/onBoardingScreen/presentation/pages/pageview.dart';
import 'features/onBoardingScreen/presentation/bloc/bloc_bloc.dart';
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
          BlocProvider(
            create: (context) => BlocBloc(),
          ),
          BlocProvider<AuthBloc>(
              create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
          BlocProvider<SignOutBloc>(create: (context) => di.sl<SignOutBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return HomePage(
                  name: state.name,
                  email: state.email,
                  uid: state.uid,
                );
              }
              if (state is Unauthenticated) {
                return const SignInPage();
              }
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
