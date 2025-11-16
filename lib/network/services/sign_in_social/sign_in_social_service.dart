import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInSocialService {
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
  Future<UserCredential> signInWithApple();
}
