import 'package:recipe_app/features/auth/data/data_models/user_model.dart';

abstract class RemoteFireStoreDataSource {
  Future<void> uploadUserToFireStore(String name, String email, String uid);
  Future<UserModel> getUserFromFireStore();
  Future<void> updateUserOnFireStore(String name, String email, String uid);

  Future<void> deleteUserFromFireStore();
}

// class RemoteFireStoreDataSourceImpl
//   implements RemoteFireStoreDataSource {

//   }
