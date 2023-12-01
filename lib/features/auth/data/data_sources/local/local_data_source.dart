import 'dart:convert';

import 'package:recipe_app/features/auth/data/data_models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferences _sharedPreferences;

  LocalDataSource(this._sharedPreferences);

  Future<void> clear() async {
    await _sharedPreferences.clear();
  }

  Future<bool> setUser(UserModel user) async {
    String userData = jsonEncode(user);
    return await _sharedPreferences.setString('user', userData);
  }

  Future<UserModel?> getUser() async {
    Map<String, dynamic> json = jsonDecode(
      _sharedPreferences.getString('user') ?? '{}',
    );
    if (json.isEmpty) {
      return null;
    }
    return UserModel.fromLocalJson(json);
  }

  Future<void> removeUser() async {
    await _sharedPreferences.remove('user');
  }
}
