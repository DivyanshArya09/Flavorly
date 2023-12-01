import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/features/auth/data/data_models/user_model.dart';
import 'package:recipe_app/features/auth/data/data_sources/remote/remote_fire_store_data_source.dart';

class RemoteFireStoreDataSourceImpl implements RemoteFireStoreDataSource {
  RemoteFireStoreDataSourceImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;
  final FirebaseFirestore? _firestore;
  @override
  Future<void> deleteUserFromFireStore(String uid) async {
    try {
      return await _firestore!.collection('users').doc(uid).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserFromFireStore(String uid) async {
    try {
      final docSnapshot = await _firestore!.collection('users').doc(uid).get();
      final authUser = UserModel(
          name: docSnapshot['name'],
          email: docSnapshot['email'],
          uid: docSnapshot['uid']);
      if (docSnapshot.data() == null) {
        throw Exception('User not found');
      }
      return authUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserOnFireStore(
      String name, String email, String uid) async {
    try {
      return await _firestore!
          .collection('users')
          .doc(uid)
          .update({'name': name, 'email': email, 'uid': uid});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadUserToFireStore(
      String name, String email, String uid) async {
    try {
      final user = UserModel(name: name, email: email, uid: uid);
      await _firestore!.collection('users').doc(uid).set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
