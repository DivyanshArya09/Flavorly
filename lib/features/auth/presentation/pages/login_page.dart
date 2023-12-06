import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/features/auth/presentation/auth_blocs/login_bloc/login_bloc.dart';
import 'package:recipe_app/features/auth/presentation/pages/sign_in.dart';
import 'package:recipe_app/features/auth/presentation/widgets/button.dart';
import 'package:recipe_app/features/auth/presentation/widgets/divider.dart';
import 'package:recipe_app/features/auth/presentation/widgets/google_button.dart';
import 'package:recipe_app/features/auth/presentation/widgets/text_field.dart';
import 'package:recipe_app/features/home/presentation/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late LoginBloc loginBloc;
  bool isVisible = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginBloc = GetIt.I.get<LoginBloc>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.buttonColor1,
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginLoaded) {
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
          } else if (state is LoginFireBaseError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is LoginConnectionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is LoginLoading) {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          } else if (state is StopLoginLoading) {
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
                          'Welcome back!',
                          style: Theme.of(context).textTheme.headlineMedium,
                          // textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'You have been missed!',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
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
                  child: Column(
                    children: [
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: AppColors.buttonColor1,
                                  value: true,
                                  onChanged: (value) {}),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Remember me",
                                // style:
                                //     Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password ?',
                                textAlign: TextAlign.right,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      SignUpLoginButton(
                        buttonText: 'Login',
                        onTap: () {
                          loginBloc.add(
                            LoginButtonPressed(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString(),
                            ),
                          );
                        },
                      ),
                      const CustomDivider(),
                      SignInWithGoogleButton(
                        onTap: () {
                          loginBloc.add(LoginWithGoogleButtonPressed());
                        },
                        text: 'Login with Google',
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'SignUp',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          )
                        ],
                      ),
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
