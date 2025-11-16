import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/sign_in_social/sign_in_social_service.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

import '../../../../../utils/exceptions/firebase_exceptions.dart';

class LoginSocialRepository {
  final SignInSocialService signInSocialService;
  final UserService userService;

  LoginSocialRepository(this.signInSocialService, this.userService);

  Future<ServerResult<UserCredential>> loginWithGoogle() async {
    try {
      final result = await signInSocialService.signInWithGoogle();

      return ServerResult.success(result);
    } catch (error) {
      return ServerResult.failure(
          QafExceptionHandler.from(error.toString()).message);
    }
  }
}
