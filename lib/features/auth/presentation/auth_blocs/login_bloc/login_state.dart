part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final AuthUser user;

  const LoginLoaded(this.user);
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);
}

class LoginServerFailure extends LoginState {
  final String message;
  const LoginServerFailure(this.message);
}

class LoginConnectionFailure extends LoginState {
  final String message;

  const LoginConnectionFailure(this.message);
}

class LoginFireBaseError extends LoginState {
  final String message;

  const LoginFireBaseError(this.message);
}

class StopLoginLoading extends LoginState {}
