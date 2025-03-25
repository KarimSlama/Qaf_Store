import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/order/data/model/order_model.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = Loading;
  const factory OrderState.success(List<OrderModel> orders) = Success;
  const factory OrderState.error({required String error}) = Error;

  const factory OrderState.processing() = Processing;
  const factory OrderState.orderSuccess(OrderModel order) =
      OrderSuccess;
  const factory OrderState.orderError({required String error}) = OrderError;
}
