import 'package:qaf_store/features/screens/login/data/model/login_request_model.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';

abstract class AuthService {
  const AuthService();

  Future<String?> signUp(UserModel userModel);
  Future<String?> login(LoginRequestModel loginRequestModel);
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signOut();
}
