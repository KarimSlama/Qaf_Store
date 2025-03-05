import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/sign_in_social/sign_in_social_service.dart';

class SignInSocialServiceImpl implements SignInSocialService {
  @override
  Future<ServerResult<UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final credential =
          await FirebaseAuth.instance.signInWithCredential(credentials);
      return ServerResult.success(credential);
    } catch (error) {
      print('the error with verify email service impl is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }
}
