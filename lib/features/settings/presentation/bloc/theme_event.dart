part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChange extends ThemeEvent {
  final ThemeMode themeMode;
  const ThemeChange({required this.themeMode});
}

class GetThemeFromLocalStorage extends ThemeEvent {
  const GetThemeFromLocalStorage();
}
