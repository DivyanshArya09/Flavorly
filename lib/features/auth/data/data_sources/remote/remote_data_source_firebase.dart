import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:recipe_app/features/auth/data/data_models/user_model.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  @override
  Future<UserModel> signInWithEmailPassword(
      String email, String password) async {
    try {
      firebase_auth.UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        throw Exception('User is null');
      }
      return UserModel.fromJson(userCredential.user!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    try {
      _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      String email, String password, String name) async {
    try {
      firebase_auth.UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final authUser =
          UserModel(name: name, email: email, uid: userCredential.user!.uid);
      if (userCredential.user == null) {
        throw Exception('User is null');
      }
      return authUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map((firebase_auth.User? user) {
      if (user == null) {
        return null;
      }
      return UserModel.fromJson(user);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return _firebaseAuth.currentUser != null;
  }
}
