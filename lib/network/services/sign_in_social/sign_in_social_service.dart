import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class SignInSocialService {
  Future<ServerResult<UserCredential>> signInWithGoogle();
}
