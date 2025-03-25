import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_pricing_calculator.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          spacing: QafSizes.spaceBtwItems / 2,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(QafStrings.subtotal,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('\$${state.noOfCartItems}',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(QafStrings.shippingFee,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(
                    '\$${QafPricingCalculator.calculateShippingCost(state.totalCartPrice, "US")}',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(QafStrings.taxFee,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(
                    '\$${QafPricingCalculator.calculateTax(state.totalCartPrice, "US")}',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(QafStrings.orderTotal,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(
                    '\$${QafPricingCalculator.calculateTotalPrice(state.totalCartPrice, "US")}',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            )
          ],
        );
      },
    );
  }
}
