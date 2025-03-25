import 'package:qaf_store/features/screens/order/data/model/order_model.dart';
import 'package:qaf_store/network/services/order/order_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class OrderRepository {
  final OrderService orderService;

  OrderRepository(this.orderService);

  Future<ServerResult<List<OrderModel>>> fetchUserOrders() async {
    try {
      final orders = await orderService.fetchUserOrders();

      return orders.when(
        success: (order) => ServerResult.success(order),
        failure: (error) => ServerResult.failure(error.toString()),
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await orderService.saveOrder(order, userId);
    } catch (error) {
    }
  }
}
