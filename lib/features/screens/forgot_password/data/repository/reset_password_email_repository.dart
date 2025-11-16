import 'package:qaf_store/network/services/auth/auth_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class ResetPasswordEmailRepository {
  final AuthService authService;

  ResetPasswordEmailRepository(this.authService);

  Future<ServerResult<void>> resetPasswordEmail(String email) async {
    try {
      await authService.sendPasswordResetEmail(email);
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(
          'Failed to send reset email: ${error.toString()}');
    }
  }
}
