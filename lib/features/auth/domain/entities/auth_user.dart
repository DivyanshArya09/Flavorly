import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String email;
  final String name;
  const AuthUser({required this.name, required this.email});

  @override
  List<Object?> get props => [name, email];
}
