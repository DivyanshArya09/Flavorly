import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/config/constants/app_colors.dart';
import 'package:recipe_app/features/settings/presentation/bloc/theme_bloc.dart';

enum ThemeModeOptions { light, dark, system }

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  ThemeModeOptions _selectedThemeMode = ThemeModeOptions.system;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Theme Mode',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile<ThemeModeOptions>(
            title: const Text('Light'),
            value: ThemeModeOptions.light,
            groupValue: _selectedThemeMode,
            onChanged: (value) {
              setState(
                () {
                  _selectedThemeMode = value!;
                },
              );
            },
          ),
          RadioListTile<ThemeModeOptions>(
            title: Text(
              'Dark',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            value: ThemeModeOptions.dark,
            groupValue: _selectedThemeMode,
            onChanged: (value) {
              setState(
                () {
                  _selectedThemeMode = value!;
                },
              );
            },
          ),
          RadioListTile<ThemeModeOptions>(
            title: Text(
              'System',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            value: ThemeModeOptions.system,
            groupValue: _selectedThemeMode,
            onChanged: (value) {
              setState(
                () {
                  _selectedThemeMode = value!;
                },
              );
            },
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            ThemeMode selectedMode;
            switch (_selectedThemeMode) {
              case ThemeModeOptions.light:
                selectedMode = ThemeMode.light;
                break;
              case ThemeModeOptions.dark:
                selectedMode = ThemeMode.dark;
                break;
              case ThemeModeOptions.system:
                selectedMode = ThemeMode.system;
                break;
            }
            BlocProvider.of<ThemeBloc>(context)
                .add(ThemeChange(themeMode: selectedMode));
            Navigator.of(context).pop(selectedMode);
          },
          child: const Text(
            'Apply',
            style: TextStyle(
              color: AppColors.buttonColor1,
            ),
          ),
        ),
      ],
    );
  }
}
