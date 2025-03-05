import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/verify_email/verify_email_service.dart';

class VerifyEmailRepository {
  final VerifyEmailService verifyEmailService;
  const VerifyEmailRepository(this.verifyEmailService);

  Future<ServerResult<void>> verifyEmail() async {
    final result = await verifyEmailService.sendEmailVerification();
    return result.when(
      success: (data) {
        return ServerResult.success(data);
      },
      failure: (error) {
        return ServerResult.failure(error);
      },
    );
  }
}
