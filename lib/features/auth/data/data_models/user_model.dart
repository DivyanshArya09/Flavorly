import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:recipe_app/features/auth/domain/entities/auth_user.dart';

class UserModel extends AuthUser {
  const UserModel(
      {required String name, required String email, required String uid})
      : super(name: name, email: email, uid: uid);

  factory UserModel.fromJson(firebase_auth.User user) {
    return UserModel(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
  factory UserModel.fromLocalJson(Map<String, dynamic> user) {
    return UserModel(
      name: user['name'] ?? '',
      email: user['email'] ?? '',
      uid: user['uid'] ?? '',
    );
  }

  AuthUser setName(String name) {
    return AuthUser(name: name, email: email, uid: uid);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'uid': uid};
  }

  AuthUser toEntity() {
    return AuthUser(name: name, email: email, uid: uid);
  }
}
