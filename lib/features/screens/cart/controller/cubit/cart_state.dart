import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/cart/data/model/cart_item_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.cartUpdated(List<CartItemModel> cartItem) = CartUpdated;
  const factory CartState.cartLoaded(List<CartItemModel> cartItem) = CartLoaded;
}
