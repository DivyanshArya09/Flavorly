import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:recipe_app/features/auth/presentation/pages/login_page.dart';
import 'package:recipe_app/features/auth/presentation/widgets/button.dart';
import 'package:recipe_app/features/auth/presentation/widgets/divider.dart';
import 'package:recipe_app/features/auth/presentation/widgets/google_button.dart';
import 'package:recipe_app/features/auth/presentation/widgets/text_field.dart';
import 'package:recipe_app/features/home/presentation/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  late SignUpBloc signUpBloc;
  bool isVisible = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    signUpBloc = GetIt.I.get<SignUpBloc>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.buttonColor1,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        bloc: signUpBloc,
        listener: (context, state) {
          if (state is SignUpLoaded) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  name: state.name,
                  email: state.email,
                  uid: state.uid,
                ),
              ),
              (Route<dynamic> route) => false,
            );
          } else if (state is SignUpFireBaseError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is SignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is SignUpConnectionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is SignUpLoading) {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          } else if (state is StopLoading) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join our culinary\n community!',
                          style: Theme.of(context).textTheme.headlineMedium,
                          // textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Create an account',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: size.height * .05),
                  height: size.height * .8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Expanded(
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Enter your name',
                          obscureText: false,
                          controller: userNameController,
                          icon: const Icon(Icons.person),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        CustomTextField(
                          hintText: 'Enter your Email',
                          obscureText: false,
                          controller: emailController,
                          icon: const Icon(Icons.email),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        CustomTextField(
                          hintText: 'Enter your password',
                          obscureText: isVisible,
                          controller: passwordController,
                          icon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: !isVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        SignUpLoginButton(
                          buttonText: 'Sign Up',
                          onTap: () {
                            signUpBloc.add(SignUpButtonPressed(
                              name: userNameController.text.toString(),
                              email: emailController.text.toString(),
                              password: passwordController.text.toString(),
                            ));
                          },
                        ),
                        const CustomDivider(),
                        SignInWithGoogleButton(
                          onTap: () {
                            signUpBloc.add(SignInWithGoogleButtonPressed());
                          },
                          text: 'Sign Up with Google',
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ));
                                },
                                child: Text(
                                  'Login',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              )
                            ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
