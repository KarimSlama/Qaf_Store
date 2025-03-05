import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/sign_in_social/sign_in_social_service.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

class LoginSocialRepository {
  final SignInSocialService signInSocialService;
  final UserService userService;

  LoginSocialRepository(this.signInSocialService, this.userService);

  Future<ServerResult<UserCredential>> loginWithSocial() async {
    final result = await signInSocialService.signInWithGoogle();
    return result.when(
      success: (userCredential) async {
        final user = userCredential.user!;
        await userService.userExists(user.uid).then((result) {
          return result.when(
            success: (data) async {
              final nameParts =
                  UserModel.nameParts(userCredential.user!.displayName ?? '');
              final username = UserModel.generateUserName(
                  userCredential.user!.displayName ?? '');
              final user = UserModel(
                  id: userCredential.user!.uid,
                  firstName: nameParts[0],
                  lastName: nameParts.length > 1
                      ? nameParts.sublist(1).join(' ')
                      : '',
                  phone: userCredential.user!.phoneNumber ?? '',
                  profilePicture: userCredential.user!.photoURL ?? '',
                  userName: username,
                  email: userCredential.user!.email ?? '');
              await userService.createUser(user);
            },
            failure: (error) {
              return false;
            },
          );
        });
        return ServerResult.success(userCredential);
      },
      failure: (error) {
        return ServerResult.failure(error);
      },
    );
  }
}
