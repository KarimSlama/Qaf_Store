import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/common/widgets/products/coupon/coupon_widget.dart';
import 'package:qaf_store/common/widgets/success_screen.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/features/screens/cart/widgets/cart_items.dart';
import 'package:qaf_store/features/screens/checkout/controller/cubit/checkout_cubit.dart';
import 'package:qaf_store/features/screens/checkout/widgets/billing_address_section.dart';
import 'package:qaf_store/features/screens/checkout/widgets/billing_amount_section.dart';
import 'package:qaf_store/features/screens/checkout/widgets/billing_payment_section.dart';
import 'package:qaf_store/features/screens/order/controller/cubit/order_cubit.dart';
import 'package:qaf_store/features/screens/order/controller/cubit/order_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/helper/qaf_pricing_calculator.dart';
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
      bottomNavigationBar: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          switch (state) {
            case OrderSuccess():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        '${QafStrings.checkoutSuccess} ${state.order.id}')),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuccessScreen(
                    title: QafStrings.checkoutSuccess,
                    subTitle: QafStrings.yourItemWillBeShippingSoon,
                    image: Assets
                        .images.animations.orderCompleteCarDeliveryAnimation,
                    onPressed: () => context.pushNamed(Routes.navigationMenu),
                  ),
                ),
              );
            case OrderError():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
          }
        },
        builder: (context, state) {
          return BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              if (cartState.cartItems.isEmpty) return const SizedBox();

              return Padding(
                padding: const EdgeInsets.all(QafSizes.defaultSpace),
                child: ElevatedButton(
                  onPressed: cartState.totalCartPrice > 0
                      ? () {
                          if (state is! Processing) {
                            final checkoutCubit =
                                BlocProvider.of<CheckoutCubit>(context);
                            final addressesCubit =
                                BlocProvider.of<AddressesCubit>(context);
                            final cartCubit =
                                BlocProvider.of<CartCubit>(context);

                            context.read<OrderCubit>().processData(
                                cartState.totalCartPrice,
                                context,
                                checkoutCubit.state.selectedPaymentMethod.name,
                                addressesCubit.selectedAddress,
                                cartCubit.state.cartItems);
                          }
                        }
                      : () => Loaders.warningSnackBar(
                            context: context,
                            title: QafStrings.emptyCart,
                            message:
                                QafStrings.addItemsInTheCartInOrderToProceed,
                          ),
                  child: state is Processing
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          '${QafStrings.checkout} \$${QafPricingCalculator.calculateTotalPrice(cartState.totalCartPrice, 'US')}',
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
