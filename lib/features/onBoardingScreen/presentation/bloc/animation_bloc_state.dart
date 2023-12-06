// ignore_for_file: must_be_immutable

part of 'animation_bloc.dart';

@immutable
sealed class AnimationState {}

final class BlocInitial extends AnimationState {}

final class AnimateFirstPage extends AnimationState {}

final class AnimateSecondPage extends AnimationState {
  double width = 200;
  AnimateSecondPage(this.width);
}

final class AnimateThirdPage extends AnimationState {}
