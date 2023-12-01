import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';

class UserModel extends AuthUser {
  const UserModel({required String name, required String email})
      : super(name: name, email: email);

  factory UserModel.fromJson(firebase_auth.User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
  factory UserModel.fromLocalJson(Map<String, dynamic> user) {
    return UserModel(
      name: user['name'] ?? '',
      email: user['email'] ?? '',
    );
  }

  AuthUser setName(String name) {
    return AuthUser(name: name, email: email);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  AuthUser toEntity() {
    return AuthUser(name: name, email: email);
  }
}
