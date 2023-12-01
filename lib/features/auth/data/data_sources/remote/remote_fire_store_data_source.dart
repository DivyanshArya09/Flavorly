import 'package:recipe_app/features/auth/data/data_models/user_model.dart';

abstract class RemoteFireStoreDataSource {
  Future<void> uploadUserToFireStore(String name, String email, String uid);
  Future<UserModel> getUserFromFireStore(String uid);
  Future<void> updateUserOnFireStore(String name, String email, String uid);
  Future<void> deleteUserFromFireStore(String uid);
}

// class RemoteFireStoreDataSourceImpl
//   implements RemoteFireStoreDataSource {

//   }
