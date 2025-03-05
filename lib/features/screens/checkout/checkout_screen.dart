import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/products/coupon/coupon_widget.dart';
import 'package:qaf_store/common/widgets/success_screen.dart';
import 'package:qaf_store/features/screens/cart/widgets/cart_items.dart';
import 'package:qaf_store/features/screens/checkout/widgets/billing_address_section.dart';
import 'package:qaf_store/features/screens/checkout/widgets/billing_amount_section.dart';
import 'package:qaf_store/features/screens/checkout/widgets/billing_payment_section.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

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
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessScreen(
                      image: Assets
                          .icons.paymentMethods.successfulPaymentIcon.path,
                      title: QafStrings.paymentSuccessful,
                      subTitle: QafStrings.yourItemWillBeShippingSoon,
                      onPressed: () => context.pushNamed(
                        Routes.navigationMenu,
                      ),
                    ),
                  ),
                ),
            child: Text('${QafStrings.checkout}  \$240')),
      ),
    );
  }
}
