import '../../../../../network/services/server_result.dart';
import '../../../../../network/services/user/user_service.dart';
import '../network/customer_service.dart';

class CustomerServiceRepository {
  final CustomerService _customerService;
  final UserService _userService;

  const CustomerServiceRepository(
      this._userService, CustomerService customerService)
      : _customerService = customerService;

  Future<ServerResult<String>> sendMessage({
    required String message,
  }) async {
    try {
      final userId = _userService.currentUserId!;

      if (userId.isEmpty) {
        return Failure('User not authenticated');
      }

      final response = await _customerService.sendMessage(
        message: message,
        userId: userId,
      );

      final aiResponse =
          response['response'] ?? response['output'] ?? 'No response received';

      return ServerResult.success(aiResponse);
    } catch (e) {
      return ServerResult.failure(e.toString());
    }
  }
}
