import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/features/screens/login/data/model/login_request_model.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/auth/auth_service.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthServiceImpl({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<String?> signUp(UserModel userModel) async {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: userModel.email,
      password: userModel.password!,
    );
    return userCredential.user?.uid;
  }

  @override
  Future<String?> login(LoginRequestModel loginRequestModel) async {
    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequestModel.email,
      password: loginRequestModel.password,
    );
    return userCredential.user?.uid;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
