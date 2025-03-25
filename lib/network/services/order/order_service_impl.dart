import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/features/screens/order/data/model/order_model.dart';
import 'package:qaf_store/network/services/order/order_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class OrderServiceImpl implements OrderService {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<ServerResult<List<OrderModel>>> fetchUserOrders() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId!.isEmpty)
        throw 'Unable to find user information. Try again in a few minutes.';
      final result = await _firestore
          .collection('users')
          .doc(userId)
          .collection('Orders')
          .get();
      final order =
          result.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
      return ServerResult.success(order);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
