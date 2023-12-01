import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String email;
  final String name;
  final String uid;
  const AuthUser({required this.name, required this.email, required this.uid});

  @override
  List<Object?> get props => [name, email, uid];
}
