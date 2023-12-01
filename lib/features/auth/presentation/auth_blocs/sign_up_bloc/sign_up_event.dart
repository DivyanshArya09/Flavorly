part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUpInitialEvent extends SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final String email;
  final String password;
  final String name;
  const SignUpButtonPressed(
      {required this.email, required this.password, required this.name});
}

class PassWordIconPressed extends SignUpEvent {}
