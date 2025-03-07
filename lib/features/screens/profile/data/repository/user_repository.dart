import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/user/user_service.dart';

class UserRepository {
  final UserService userService;

  UserRepository(this.userService);

  Future<ServerResult<UserModel>> fetchUserDetails() async {
    try {
      final result = await userService.fetchUserDetails();
      return result.when(
        success: (user) {
          print('the user with user repo is ${user.email}');
          return ServerResult.success(user);
        },
        failure: (error) {
          print('the error with user repo is $error');
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      print('the error with user repo is $error');
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> updateSingleField(Map<String, dynamic> map) async {
    try {
      final result = await userService.updateSingleField(map);
      return result.when(
        success: (data) {
          return ServerResult.success(data);
        },
        failure: (error) {
          print('the error with update single field is ${error.toString()}');
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      print('the error with update single field is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> deleteUserAccount(String uId) async {
    try {
      final result = await userService.removeUserRecord(uId);
      return result.when(
        success: (data) {
          return ServerResult.success(data);
        },
        failure: (error) {
          print('the error with remove field is ${error.toString()}');
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      print('the error with remve  field is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> reAuthenticateEmailAndPassword(
      email, password) async {
    try {
      final user =
          await userService.reAuthenticateEmailAndPassword(email, password);
      return user.when(
        success: (data) {
          return ServerResult.success(data);
        },
        failure: (error) {
          print('the error with reauth is ${error.toString()}');
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      print('the error with reauth  is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }
}
