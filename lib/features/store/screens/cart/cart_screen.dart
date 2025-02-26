import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/products/cart/product_quantity_with_add_remove_btn.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/features/store/screens/cart/widgets/cart_item.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.cart,
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              SizedBox(height: QafSizes.spaceBtwSections),
          itemCount: 12,
          itemBuilder: (_, index) => Column(
            spacing: QafSizes.md,
            children: [
              CartItem(),
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: QafSizes.defaultSpace,
            end: QafSizes.defaultSpace,
            bottom: QafSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: Text('${QafStrings.checkout}  \$240')),
      ),
    );
  }
}
