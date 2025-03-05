import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/features/screens/login/data/model/login_request_model.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/auth/auth_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<ServerResult<String?>> signUp(UserModel userModel) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password!,
      );
      String uid = userCredential.user!.uid;
      return ServerResult.success(uid);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<String?>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: loginRequestModel.email,
              password: loginRequestModel.password);
      String uid = userCredential.user!.uid;
      return ServerResult.success(uid);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> sendPasswordResetEmail(String email) async {
    try {
      final response = await firebaseAuth.sendPasswordResetEmail(email: email);
      return ServerResult.success(response);
    } catch (error) {
      print(
          'the error with reset password fun in auth impl is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
