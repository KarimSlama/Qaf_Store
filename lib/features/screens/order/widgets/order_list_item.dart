import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return ListView.separated(
      separatorBuilder: (_, __) => SizedBox(height: QafSizes.spaceBtwItems),
      itemCount: 12,
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        padding: EdgeInsetsDirectional.all(QafSizes.md),
        backgroundColor: dark ? QafColors.dark : QafColors.light,
        child: Column(
          spacing: QafSizes.spaceBtwItems / 2,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: QafSizes.spaceBtwItems / 2,
              children: [
                Icon(Iconsax.ship),
                Expanded(
                  child: Column(
                    spacing: QafSizes.xs,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        QafStrings.processing,
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: QafColors.primary, fontWeightDelta: 1),
                      ),
                      Text('27 Feb, 2025',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                Icon(Iconsax.arrow_right_34, size: QafSizes.iconSm),
              ],
            ),
            Row(
              spacing: QafSizes.spaceBtwItems / 2,
              children: [
                Expanded(
                  child: Row(
                    spacing: QafSizes.spaceBtwItems / 2,
                    children: [
                      Icon(Iconsax.tag),
                      Expanded(
                        child: Column(
                          spacing: QafSizes.xs,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              QafStrings.order,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text('#65392',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    spacing: QafSizes.spaceBtwItems / 2,
                    children: [
                      Icon(Iconsax.calendar),
                      Expanded(
                        child: Column(
                          spacing: QafSizes.xs,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              QafStrings.shippingDate,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text('27 Feb, 2025',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
