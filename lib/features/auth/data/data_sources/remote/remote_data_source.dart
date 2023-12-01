import 'package:recipe_app/features/auth/data/data_models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmailPassword(String email, String password);

  Future<UserModel> signUpWithEmailPassword(String email, String password);

  Future<void> signOut();

  Future<UserModel> signInWithGoogle();

  Stream<UserModel?> get user;

  Future<bool> isLoggedIn();
}
