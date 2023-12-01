import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/sign_out_bloc/sign_out_bloc.dart';
import 'package:recipe_app/features/auth/presentation/pages/sign_in.dart';

class HomePage extends StatelessWidget {
  final String name, email;
  const HomePage({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.I.get<SignOutBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Welcome $name'),
        Text('Email: $email'),
        BlocConsumer<SignOutBloc, SignOutState>(
          bloc: bloc,
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                bloc.add(SignOutButtonPressed());
              },
              child: const Text('Logout'),
            );
          },
          listener: (BuildContext context, SignOutState state) {
            if (state is SignOutLoaded) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ));
            }

            if (state is SignOutServerFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
            if (state is SignOutLoaded) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ));
            }

            if (state is SignOutLoading) {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }
          },
        )
      ])),
    );
  }
}
