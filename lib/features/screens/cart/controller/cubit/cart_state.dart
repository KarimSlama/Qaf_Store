import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/cart/data/model/cart_item_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_variation_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required List<CartItemModel> cartItems,
    required int noOfCartItems,
    required double totalCartPrice,
    required int productQuantityInCart,
    required Map<String, dynamic> selectedAttributes,
    required String variationStockStatus,
    required ProductVariationModel productVariationModel,
  }) = _CartState;
  factory CartState.initial() => CartState(
        cartItems: [],
        noOfCartItems: 0,
        totalCartPrice: 0.0,
        productQuantityInCart: 0,
        selectedAttributes: {},
        variationStockStatus: '',
        productVariationModel: ProductVariationModel.empty(),
      );
}
