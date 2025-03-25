import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/features/screens/cart/data/model/cart_item_model.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmout;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? addressModel;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.totalAmout,
    required this.orderDate,
    required this.items,
    this.paymentMethod = 'Paypal',
    this.addressModel,
    this.deliveryDate,
  });

  String get formattedOrderDate =>
      QafHelperFunctions.getFormattedDate(orderDate);
  String get formattedDeliveryDate => deliveryDate != null
      ? QafHelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.DELIVERED
      ? 'Delivered'
      : status == OrderStatus.SHIPPED
          ? 'Shipment on the Way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmout,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'Addresses': addressModel?.toJson(),
      'deliveryDate': deliveryDate,
      'items': items.map((item) => item.toJson()).toList()
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      status:
          OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      totalAmout: data['totalAmount'],
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      addressModel:
          AddressModel.fromJson(data['Addresses'] as Map<String, dynamic>),
      deliveryDate: data['deliveryDate'] == null
          ? null
          : (data['deliveryDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      items: (data['items'] as List<dynamic>)
          .map((itemData) =>
              CartItemModel.fromJson(itemData as Map<String, dynamic>))
          .toList(),
    );
  }
}
