import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/auth/auth_service.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

import '../../../../../utils/exceptions/firebase_exceptions.dart';

class RegisterRepository {
  final AuthService _authService;
  final UserService _userService;

  RegisterRepository(this._authService, this._userService);

  Future<ServerResult<String?>> signUp(UserModel userModel) async {
    try {
      // Sign up with Firebase Auth
      final uId = await _authService.signUp(userModel);

      if (uId == null) {
        return ServerResult.failure("Failed to create user account");
      }

      // Create user document in Firestore
      final updatedUserModel = userModel.copyWith(id: uId);
      await _userService.createUser(updatedUserModel);

      return ServerResult.success(uId);
    } catch (error) {
      return ServerResult.failure(
          QafExceptionHandler.from(error.toString()).message);
    }
  }
}
