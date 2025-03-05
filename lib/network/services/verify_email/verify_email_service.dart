import 'package:qaf_store/network/services/server_result.dart';

abstract class VerifyEmailService{
  Future<ServerResult<void>> sendEmailVerification();
}