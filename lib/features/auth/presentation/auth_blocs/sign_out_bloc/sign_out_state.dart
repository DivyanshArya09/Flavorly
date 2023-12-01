part of 'sign_out_bloc.dart';

sealed class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => [];
}

final class SignOutInitial extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutLoaded extends SignOutState {}

class SignOutError extends SignOutState {
  final String message;

  const SignOutError(this.message);
}

class SignOutServerFailure extends SignOutState {
  final String message;

  const SignOutServerFailure(this.message);
}
