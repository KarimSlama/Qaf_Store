import 'package:qaf_store/network/services/auth/auth_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class ResetPasswordEmailRepository {
  final AuthService authService;

  ResetPasswordEmailRepository(this.authService);

  Future<ServerResult<void>> resetPasswordEmail(String email) async {
    final response = await authService.sendPasswordResetEmail(email);
    return response.when(success: (_) {
      return ServerResult.success(_);
    }, failure: (error) {
      return ServerResult.failure(error);
    });
  }
}
