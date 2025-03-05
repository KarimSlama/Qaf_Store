import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/verify_email/verify_email_service.dart';
import 'package:qaf_store/utils/exceptions/firebase_auth_exceptions.dart';

class VerifyEmailServiceImpl implements VerifyEmailService {
  @override
  Future<ServerResult<void>> sendEmailVerification() async {
    try {
      final response =
          await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      return ServerResult.success(response);
    } on FirebaseAuthException catch (error) {
      throw QafFirebaseAuthException(error.code).message;
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
