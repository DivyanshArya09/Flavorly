// ignore_for_file: must_be_immutable

part of 'animation_bloc.dart';

@immutable
sealed class BlocState {}

final class BlocInitial extends BlocState {}

final class AnimateFirstPage extends BlocState {}

final class AnimateSecondPage extends BlocState {
  double width = 200;
  AnimateSecondPage(this.width);
}

final class AnimateThirdPage extends BlocState {}
