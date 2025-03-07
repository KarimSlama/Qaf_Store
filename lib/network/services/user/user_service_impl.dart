import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

class UserServiceImpl implements UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<ServerResult<void>> createUser(UserModel userModel) async {
    try {
      final response = await _firestore
          .collection('users')
          .doc(userModel.id)
          .set(userModel.toJson());
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<bool>> userExists(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      return ServerResult.success(doc.exists);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<UserModel>> fetchUserDetails() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return ServerResult.failure("User is not logged in");
    }
    try {
      final documentSnapshot =
          await _firestore.collection('users').doc(user.uid).get();

      if (documentSnapshot.exists) {
        final userModel = UserModel.fromSnapshot(documentSnapshot);
        return ServerResult.success(userModel);
      } else {
        return ServerResult.failure("User data not found");
      }
    } catch (error) {
      print('Error fetching user details: ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> updateUserDetails(UserModel userModel) async {
    try {
      final response = await _firestore
          .collection('users')
          .doc(userModel.id)
          .update(userModel.toJson());
      return ServerResult.success(response);
    } catch (error) {
      print(
          'the error with user service imp with update user details is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> updateSingleField(
      Map<String, dynamic> json) async {
    try {
      final response =
          await _firestore.collection('users').doc(userId).update(json);
      return ServerResult.success(response);
    } catch (error) {
      print('the error with update single user detail is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> removeUserRecord(String uId) async {
    try {
      final response =
          await _firestore.collection('users').doc(uId).delete();
          FirebaseAuth.instance.currentUser!.delete();
      return ServerResult.success(response);
    } catch (error) {
      print(
          'the error with delete or remove record of user is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> reAuthenticateEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential authCredential =
          EmailAuthProvider.credential(email: email, password: password);
      final userCredential = await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(authCredential);
      return ServerResult.success(userCredential);
    } catch (error) {
      print('the error with reauth  is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }
}
