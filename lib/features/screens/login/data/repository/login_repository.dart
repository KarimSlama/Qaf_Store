import 'package:qaf_store/features/screens/login/data/model/login_request_model.dart';
import 'package:qaf_store/network/services/auth/auth_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class LoginRepository {
  final AuthService registerService;

  LoginRepository(this.registerService);

  Future<ServerResult<String?>> login(String email, String password) async {
    LoginRequestModel loginRequestModel =
        LoginRequestModel(email: email, password: password);

    ServerResult<String?> result =
        await registerService.login(loginRequestModel);

    return result.when(success: (uId) {
      return ServerResult.success(uId);
    }, failure: (error) {
      return ServerResult.failure(error);
    });
  }
}
