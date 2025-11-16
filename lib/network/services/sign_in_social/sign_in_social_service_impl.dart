import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

import 'sign_in_social_service.dart';

class SignInSocialServiceImpl implements SignInSocialService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserService _userService;

  SignInSocialServiceImpl(this._userService);

  // @override
  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   if (googleUser == null) throw Exception("Google sign-in aborted");

  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   final userCredential = await _auth.signInWithCredential(credential);
  //   final user = userCredential.user;

  //   if (user == null) throw Exception("Failed to authenticate with Google");

  //   await _createUserIfNotExists(user);
  //   return userCredential;
  // }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '171726759509-5bcccv6uv6g7p06p4v1371nilhc3dlrf.apps.googleusercontent.com',
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw Exception("Google sign-in aborted");

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    final user = userCredential.user;

    if (user == null) throw Exception("Failed to authenticate with Google");

    await _createUserIfNotExists(user);
    return userCredential;
  }

// class SignInSocialServiceImpl {
//   final SignInSocialService _signInSocialService;
//   final UserService _userService;

//   SignInSocialServiceImpl(this._signInSocialService, this._userService);

//   Future<UserCredential> loginWithGoogle() async {
//     // Sign in with Google
//     final userCredential = await _signInSocialService.signInWithGoogle();
//     final user = userCredential.user;

//     if (user == null) {
//       throw Exception("Failed to authenticate with Google");
//     }

//     // Check if user exists in Firestore
//     final exists = await _userService.userExists(user.uid);

//     // Create user document if doesn't exist
//     if (!exists) {
//       final nameParts = UserModel.nameParts(user.displayName ?? '');
//       final username = UserModel.generateUserName(user.displayName ?? '');

//       final newUser = UserModel(
//         id: user.uid,
//         firstName: nameParts[0],
//         lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
//         phone: user.phoneNumber ?? '',
//         profilePicture: user.photoURL ?? '',
//         userName: username,
//         email: user.email ?? '',
//       );

//       await _userService.createUser(newUser);
//     }

//     return userCredential;
//   }

  // Future<UserCredential> loginWithFacebook() async {
  //   final userCredential = await _signInSocialService.signInWithFacebook();
  //   final user = userCredential.user;

  //   if (user == null) {
  //     throw Exception("Failed to authenticate with Facebook");
  //   }

  //   final exists = await _userService.userExists(user.uid);

  //   if (!exists) {
  //     final nameParts = UserModel.nameParts(user.displayName ?? '');
  //     final username = UserModel.generateUserName(user.displayName ?? '');

  //     final newUser = UserModel(
  //       id: user.uid,
  //       firstName: nameParts[0],
  //       lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
  //       phone: user.phoneNumber ?? '',
  //       profilePicture: user.photoURL ?? '',
  //       userName: username,
  //       email: user.email ?? '',
  //     );

  //     await _userService.createUser(newUser);
  //   }

  //   return userCredential;
  // }

  // Future<UserCredential> loginWithApple() async {
  //   final userCredential = await _signInSocialService.signInWithApple();
  //   final user = userCredential.user;

  //   if (user == null) {
  //     throw Exception("Failed to authenticate with Apple");
  //   }

  //   final exists = await _userService.userExists(user.uid);

  //   if (!exists) {
  //     final nameParts = UserModel.nameParts(user.displayName ?? '');
  //     final username = UserModel.generateUserName(user.displayName ?? '');

  //     final newUser = UserModel(
  //       id: user.uid,
  //       firstName: nameParts[0],
  //       lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
  //       phone: user.phoneNumber ?? '',
  //       profilePicture: user.photoURL ?? '',
  //       userName: username,
  //       email: user.email ?? '',
  //     );

  //     await _userService.createUser(newUser);
  //   }

  //   return userCredential;
  // }
// }

  // 🧠 Helper method
  Future<void> _createUserIfNotExists(User user) async {
    final exists = await _userService.userExists(user.uid);

    if (!exists) {
      final nameParts = UserModel.nameParts(user.displayName ?? '');
      final username = UserModel.generateUserName(user.displayName ?? '');

      final newUser = UserModel(
        id: user.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        phone: user.phoneNumber ?? '',
        profilePicture: user.photoURL ?? '',
        userName: username,
        email: user.email ?? '',
      );

      await _userService.createUser(newUser);
    }
  }

  @override
  Future<UserCredential> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }
}
