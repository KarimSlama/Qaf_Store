import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/products/cart/product_quantity_with_add_remove_btn.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/features/store/screens/cart/widgets/cart_item.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class CartItems extends StatelessWidget {
  final bool showAndRemoveButton;
  const CartItems({super.key, this.showAndRemoveButton = true});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: QafSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        spacing: QafSizes.md,
        children: [
          CartItem(),
          if (showAndRemoveButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ProductQuantityWithAddRemoveButton(),
                  ],
                ),
                ProductPriceText(price: '240'),
              ],
            ),
        ],
      ),
    );
  }
}
