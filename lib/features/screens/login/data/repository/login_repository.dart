import 'package:qaf_store/features/screens/login/data/model/login_request_model.dart';
import 'package:qaf_store/network/services/auth/auth_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

import '../../../../../utils/exceptions/firebase_exceptions.dart';

class LoginRepository {
  final AuthService _authService;

  LoginRepository(this._authService);

  Future<ServerResult<String?>> login(LoginRequestModel loginRequest) async {
    try {
      final uId = await _authService.login(loginRequest);

      if (uId == null) {
        return ServerResult.failure("Failed to login");
      }

      return ServerResult.success(uId);
    } catch (error) {
      return ServerResult.failure(
          QafExceptionHandler.from(error.toString()).message);
    }
  }

  Future<ServerResult<void>> sendPasswordResetEmail(String email) async {
    try {
      await _authService.sendPasswordResetEmail(email);
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(
          QafExceptionHandler.from(error.toString()).message);
    }
  }

  Future<ServerResult<void>> signOut() async {
    try {
      await _authService.signOut();
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(
          QafExceptionHandler.from(error.toString()).message);
    }
  }
}
