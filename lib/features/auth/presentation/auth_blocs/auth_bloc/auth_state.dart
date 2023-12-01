part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

// class AppStarted extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String name, email, uid;

  const Authenticated(this.name, this.email, this.uid);
}

class Unauthenticated extends AuthState {}

class ConnectionFailure extends AuthState {
  final String message;

  const ConnectionFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ConnectionFailure { message: $message }';
}
