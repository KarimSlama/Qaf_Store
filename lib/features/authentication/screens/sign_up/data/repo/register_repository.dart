import 'package:qaf_store/features/authentication/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/auth/auth_service.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

class RegisterRepository {
  final AuthService registerService;
  final UserService userService;
  RegisterRepository(this.registerService, this.userService);

  Future<ServerResult<String?>> signUp(UserModel userModel) async {
    try {
      final result = await registerService.signUp(userModel);

      return result.when(success: (uId) async {
        userModel = userModel.copyWith(id: uId);
        await userService.createUser(userModel);
        return ServerResult.success(uId);
      }, failure: (error) {
        return ServerResult.failure(error);
      });
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
