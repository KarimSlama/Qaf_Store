import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/chip/choice_chip.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Column(
      spacing: QafSizes.spaceBtwItems,
      children: [
        RoundedContainer(
          padding: EdgeInsetsDirectional.all(QafSizes.sm),
          backgroundColor: dark ? QafColors.darkerGrey : QafColors.grey,
          child: Column(
            spacing: QafSizes.spaceBtwItems / 3,
            children: [
              Row(
                spacing: QafSizes.spaceBtwItems,
                children: [
                  SectionHeading(text: 'Variation', isActionButton: false),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: QafSizes.defaultSpace / 3,
                    children: [
                      Row(
                        spacing: QafSizes.spaceBtwItems,
                        children: [
                          ProductTitleText(title: 'Price', smallSize: true),
                          Text(
                            '\$250',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          ProductPriceText(price: '200'),
                        ],
                      ),
                      Row(
                        spacing: QafSizes.spaceBtwItems,
                        children: [
                          ProductTitleText(
                              title: QafStrings.status, smallSize: true),
                          Text(
                            QafStrings.inStock,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ProductTitleText(
                title:
                    'This is the description of the product and it can go up to max 4 lines.',
                smallSize: true,
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: QafSizes.spaceBtwItems / 2,
          children: [
            SectionHeading(text: 'Colors', isActionButton: false),
            Wrap(
              children: [
                QafChoiceChip(
                    text: 'Red', isSelected: true, onSelected: (value) {}),
                QafChoiceChip(
                    text: 'Green', isSelected: false, onSelected: (value) {}),
                QafChoiceChip(
                    text: 'Blue', isSelected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: QafSizes.spaceBtwItems / 2,
          children: [
            SectionHeading(text: 'Sizes', isActionButton: false),
            Wrap(
              spacing: QafSizes.spaceBtwItems / 1.5,
              children: [
                QafChoiceChip(
                    text: 'EU 34', isSelected: true, onSelected: (value) {}),
                QafChoiceChip(
                    text: 'EU 36', isSelected: false, onSelected: (value) {}),
                QafChoiceChip(
                    text: 'EU 38', isSelected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
