part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginInitialEvent extends LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  const LoginButtonPressed({required this.email, required this.password});
}

class LoginWithGoogleButtonPressed extends LoginEvent {}
