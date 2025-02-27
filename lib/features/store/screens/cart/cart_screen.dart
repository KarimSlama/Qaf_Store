import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/features/store/screens/cart/widgets/cart_items.dart';
import 'package:qaf_store/features/store/screens/checkout/checkout_screen.dart';
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
        child: CartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: QafSizes.defaultSpace,
            end: QafSizes.defaultSpace,
            bottom: QafSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text('${QafStrings.checkout}  \$240')),
      ),
    );
  }
}
