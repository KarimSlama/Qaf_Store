import 'package:qaf_store/features/screens/login/data/model/login_request_model.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class AuthService {
  const AuthService();

  Future<ServerResult<String?>> signUp(UserModel userModel);

  Future<ServerResult<String?>> login(LoginRequestModel loginRequestModel);

  Future<ServerResult<void>> sendPasswordResetEmail(String email);

  Future<void> signOut();
}
