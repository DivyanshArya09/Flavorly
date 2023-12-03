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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    name: state.name,
                    email: state.email,
                    uid: state.email,
                  ),
                ));
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
        // buildWhen: (prev, current) =>
        //     current is SignUpPassWordVisible || current is SignUpInitial,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .2,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join our culinary\n community!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          // textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Create an account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: size.height * .05),
                  height: size.height * .8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Enter your name',
                        obscureText: false,
                        controller: userNameController,
                        icon: const Icon(Icons.person),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hintText: 'Enter your Email',
                        obscureText: false,
                        controller: emailController,
                        icon: const Icon(Icons.email),
                      ),
                      const SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 40,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ));
                              },
                              child: const Text(
                                'Login',
                              ),
                            )
                          ])
                    ],
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
