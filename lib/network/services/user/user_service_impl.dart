import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

class UserServiceImpl implements UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
}
