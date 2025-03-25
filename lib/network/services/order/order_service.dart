import 'package:qaf_store/features/screens/order/data/model/order_model.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class OrderService {
  Future<ServerResult<List<OrderModel>>> fetchUserOrders();
  Future<void> saveOrder(OrderModel order, String userId);
}