part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  final String name, uid, email;
  const SignUpLoaded(
      {required this.name, required this.uid, required this.email});
}

class SignUpError extends SignUpState {
  final String message;
  const SignUpError(this.message);
}

class SignUpServerFailure extends SignUpState {
  final String message;
  const SignUpServerFailure(this.message);
}

class SignUpConnectionFailure extends SignUpState {
  final String message;

  const SignUpConnectionFailure(this.message);
}

class SignUpFireBaseError extends SignUpState {
  final String message;

  const SignUpFireBaseError(this.message);
}

class StopLoading extends SignUpState {}
