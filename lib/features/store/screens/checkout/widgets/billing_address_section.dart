import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: QafSizes.sm,
      children: [
        SectionHeading(
          text: 'Shipping Address',
          buttonText: 'Change',
          isActionButton: true,
          onPressed: () {},
        ),
        Text('Karim Slama', style: Theme.of(context).textTheme.bodyLarge),
        Row(
          spacing: QafSizes.sm,
          children: [
            const Icon(
              Iconsax.call,
              color: QafColors.grey,
              size: 16,
            ),
            Text('+20 1095856941',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          spacing: QafSizes.sm,
          children: [
            const Icon(
              Iconsax.location,
              color: QafColors.grey,
              size: 16,
            ),
            Text('56 St., Cairo, Egypt',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        )
      ],
    );
  }
}
