import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/products/cart/product_quantity_with_add_remove_btn.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/features/screens/cart/widgets/cart_item.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class CartItems extends StatelessWidget {
  final bool showAndRemoveButton;
  const CartItems({super.key, this.showAndRemoveButton = true});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              SizedBox(height: QafSizes.spaceBtwSections),
          itemCount: state.cartItems.length,
          itemBuilder: (_, index) {
            final item = state.cartItems[index];
            return Column(
              spacing: QafSizes.md,
              children: [
                CartItem(cartItem: item),
                if (showAndRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ProductQuantityWithAddRemoveButton(
                            quantity: item.quantity,
                            add: () => cartCubit.addOneToCart(item),
                            remove: () =>
                                cartCubit.removeOneFromCart(item, context),
                          ),
                        ],
                      ),
                      ProductPriceText(
                          price: (item.price * item.quantity)
                              .toStringAsFixed(1)),
                    ],
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
