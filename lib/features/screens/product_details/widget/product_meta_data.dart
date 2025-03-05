import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/images/circular_image.dart';
import 'package:qaf_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Column(
      spacing: QafSizes.spaceBtwItems / 1.5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          spacing: QafSizes.spaceBtwItems,
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: QafSizes.sm,
              backgroundColor: QafColors.secendary.withValues(alpha: .8),
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: QafSizes.sm, vertical: QafSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: QafColors.black),
              ),
            ),
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            ProductPriceText(price: '200', isLarge: true),
          ],
        ),
        ProductTitleText(title: 'Red Living Room with Large Bed'),
        Row(
          spacing: QafSizes.spaceBtwItems,
          children: [
            ProductTitleText(title: QafStrings.status),
            Text(
              QafStrings.inStock,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          spacing: QafSizes.defaultSpace / 3,
          children: [
            CircularImage(
              image: Assets.images.products.nikeShoes.path,
              width: 32.w,
              height: 32.h,
              overlayColor: dark ? QafColors.white : QafColors.black,
            ),
            BrandTitleTextWithVerificationIcon(
                title: 'Nike', brandTextSize: TextSizes.MEDIUM),
          ],
        )
      ],
    );
  }
}
