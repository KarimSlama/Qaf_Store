import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: QafSizes.spaceBtwItems / 2,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(QafStrings.subtotal,
                style: Theme.of(context).textTheme.bodyMedium),
            Text('\$480', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(QafStrings.shippingFee,
                style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(QafStrings.taxFee,
                style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(QafStrings.orderTotal, style: Theme.of(context).textTheme.bodyMedium),
            Text('\$492', style: Theme.of(context).textTheme.titleMedium),
          ],
        )
      ],
    );
  }
}
