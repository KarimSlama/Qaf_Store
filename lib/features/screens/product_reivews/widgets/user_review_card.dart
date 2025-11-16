import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/products/rating_bar.dart';
import 'package:qaf_store/common/widgets/texts/read_more_text.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Column(
      spacing: QafSizes.spaceBtwItems,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: QafSizes.spaceBtwItems,
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/96607967?s=48&v=4')),
                Text('Karim Slama',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.more))
          ],
        ),
        Row(
          spacing: QafSizes.spaceBtwItems,
          children: [
            QafRatingBarIndicator(rating: 5),
            Text('26 Feb, 2025', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        QafReadMoreText(
            text:
                'I had an amazing experience with this company! The customer service was top-notch, and the product exceeded my expectations. I highly recommend them to anyone looking for quality products and excellent service.',
            lines: 2),
        RoundedContainer(
          backgroundColor: dark ? QafColors.darkerGrey : QafColors.grey,
          padding: EdgeInsetsDirectional.all(QafSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(QafStrings.appTitle,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('26 Feb, 2025',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              QafReadMoreText(
                  text:
                      'We truly appreciate your continuous support and trust in us. Your 5-star review brightens our day and serves as a constant reminder of why we love what we do.',
                  lines: 2)
            ],
          ),
        )
      ],
    );
  }
}
