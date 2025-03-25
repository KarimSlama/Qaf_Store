import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/features/screens/cart/data/model/cart_item_model.dart';
import 'package:qaf_store/features/screens/order/controller/cubit/order_state.dart';
import 'package:qaf_store/features/screens/order/data/model/order_model.dart';
import 'package:qaf_store/features/screens/order/data/repository/order_repository.dart';
import 'package:qaf_store/utils/constants/enum.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository orderRepository;
  OrderCubit(this.orderRepository) : super(OrderState.initial());

  Future<void> fetchUserOrders() async {
    try {
      emit(OrderState.loading());
      final orders = await orderRepository.fetchUserOrders();
      orders.when(
        success: (data) => emit(OrderState.success(data)),
        failure: (error) {
          emit(OrderState.error(error: error));
        },
      );
    } catch (error) {
      emit(OrderState.error(error: error.toString()));
    }
  }

  void processData(double totalAmout, context, paymentMethod,
      AddressModel addressModel, List<CartItemModel> items) async {
    emit(OrderState.processing());
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null || userId.isEmpty) {
        emit(OrderState.orderError(error: "User not authenticated"));
        return;
      }

      final order = OrderModel(
          id: UniqueKey().toString(),
          status: OrderStatus.PENDING,
          totalAmout: totalAmout,
          orderDate: DateTime.now(),
          items: items,
          addressModel: addressModel,
          deliveryDate: DateTime.now(),
          paymentMethod: paymentMethod,
          userId: userId);

      await orderRepository.saveOrder(order, userId);
      emit(OrderState.orderSuccess(order));
    } catch (error) {
      emit(OrderState.orderError(error: error.toString()));
    }
  }
}
