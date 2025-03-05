import 'package:qaf_store/features/authentication/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class UserService{
  Future<ServerResult<void>> createUser(UserModel userModel);

  Future<ServerResult<bool>> userExists(String userId);
}