import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart' show UserModel;

abstract class UserService {
  Future<void> createUser(UserModel userModel);
  Future<UserModel> fetchUserDetails();
  Future<void> updateUserDetails(UserModel userModel);
  Future<void> updateSingleField(Map<String, dynamic> json);
  Future<void> removeUserRecord(String uId);
  Future<void> reAuthenticateEmailAndPassword(String email, String password);
  Future<bool> userExists(String userId);
  String? get currentUserId;
}
