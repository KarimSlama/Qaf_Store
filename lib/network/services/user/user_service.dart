import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class UserService {
  Future<ServerResult<void>> createUser(UserModel userModel);
  Future<ServerResult<UserModel>> fetchUserDetails();
  Future<ServerResult<void>> updateUserDetails(UserModel userModel);
  Future<ServerResult<void>> updateSingleField(Map<String, dynamic> json);
  Future<ServerResult<void>> removeUserRecord(String uId);
  Future<ServerResult<void>> reAuthenticateEmailAndPassword(String email, String password);
  Future<ServerResult<bool>> userExists(String userId);
}
