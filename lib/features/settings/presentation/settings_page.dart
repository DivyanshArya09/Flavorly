import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:Flavorly/config/constants/app_colors.dart';
import 'package:Flavorly/features/auth/presentation/auth_blocs/sign_out_bloc/sign_out_bloc.dart';
import 'package:Flavorly/features/auth/presentation/pages/login_page.dart';
import 'package:Flavorly/features/settings/widgets/theme_selector.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _refrenceBloc = GetIt.I.get<SignOutBloc>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignOutBloc, SignOutState>(
            bloc: _refrenceBloc,
            listener: (context, state) {
              if (state is SignOutLoaded) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              }

              if (state is SignOutLoading) {
                const Center(child: CircularProgressIndicator());
              }
            })
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            _options(() {
              _changeTheme();
            }, "Change Theme"),
            _options(() {
              showAboutDialog(
                  context: context,
                  applicationName: 'Recipe App',
                  applicationVersion: '1.0.0');
            }, "About"),
            _options(() {
              _onSignOut();
            }, "Sign out"),
          ],
        ),
      ),
    );
  }

  _changeTheme() {
    showDialog(
        context: context,
        builder: (context) {
          return const ThemeSelector();
        });
  }

  _options(VoidCallback onTap, String text) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(color: AppColors.darkGrey, width: 1),
          ),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            const Icon(Icons.chevron_right_sharp)
          ],
        ),
      ),
    );
  }

  _onSignOut() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text(
            'Are you sure you want to sign out?',
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                )),
            TextButton(
                onPressed: () {
                  _refrenceBloc.add(SignOutButtonPressed());
                },
                child: const Text(
                  'Sign out',
                ))
          ],
        );
      },
    );
  }
}
