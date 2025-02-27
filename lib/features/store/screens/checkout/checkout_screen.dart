import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/products/coupon/coupon_widget.dart';
import 'package:qaf_store/common/widgets/success_screen.dart';
import 'package:qaf_store/features/store/screens/cart/widgets/cart_items.dart';
import 'package:qaf_store/features/store/screens/checkout/widgets/billing_address_section.dart';
import 'package:qaf_store/features/store/screens/checkout/widgets/billing_amount_section.dart';
import 'package:qaf_store/features/store/screens/checkout/widgets/billing_payment_section.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/navigation_menu.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.checkout,
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwSections,
            children: [
              CartItems(showAndRemoveButton: false),
              CouponWidget(),
              RoundedContainer(
                showBorder: true,
                padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
                backgroundColor: dark ? QafColors.black : QafColors.white,
                child: Column(
                  spacing: QafSizes.spaceBtwItems,
                  children: [
                    BillingAmountSection(),
                    Divider(),
                    BillingPaymentSection(),
                    Divider(),
                    BillingAddressSection(),
                  ],
                ),
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
            onPressed: () => Get.to(() => SuccessScreen(
                  title: 'Payment Successful!',
                  subTitle: 'You item will be shipping soon!',
                  image: Assets.icons.paymentMethods.successfulPaymentIcon.path,
                  onPressed: () => Get.to(() => NavigationMenu()),
                )),
            child: Text('${QafStrings.checkout}  \$240')),
      ),
    );
  }
}
