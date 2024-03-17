import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeChange>((event, emit) {
      final sharedPreferences = GetIt.I.get<SharedPreferences>();

      sharedPreferences.setString('themeMode', event.themeMode.name);
      emit(const ThemeState().copyWith(themeMode: event.themeMode));
    });
    on<GetThemeFromLocalStorage>((event, emit) async {
      final sharedPreferences = GetIt.I.get<SharedPreferences>();

      final themeName = sharedPreferences.getString('themeMode') ?? 'system';

      ThemeMode themeMode =
          ThemeMode.values.firstWhere((element) => element.name == themeName);

      emit(const ThemeState().copyWith(themeMode: themeMode));
    });
  }
}
