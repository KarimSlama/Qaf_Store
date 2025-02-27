import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Container(
      width: 320.w,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(QafSizes.productImageRadius),
        color: dark ? QafColors.darkerGrey : QafColors.lightGrey,
      ),
      child: Row(
        spacing: QafSizes.spaceBtwItems / 2,
        children: [
          RoundedContainer(
            height: 120.h,
            padding: const EdgeInsetsDirectional.all(QafSizes.sm),
            backgroundColor: dark ? QafColors.dark : QafColors.light,
            child: Stack(
              children: [
                SizedBox(
                    width: 120.w,
                    height: 120.h,
                    child: RoundedImage(
                        imageUrl: Assets.images.products.product1.path)),
                PositionedDirectional(
                  top: 12,
                  child: RoundedContainer(
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
                ),
                const PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 172.w,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: QafSizes.sm, start: QafSizes.sm),
              child: Column(
                children: [
                  Column(
                    spacing: QafSizes.spaceBtwItems / 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                        title: 'Black Nike Half Sleeves shoes',
                        smallSize: true,
                      ),
                      BrandTitleTextWithVerificationIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: ProductPriceText(price: '240')),
                      Container(
                        decoration: BoxDecoration(
                          color: QafColors.dark,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(QafSizes.borderRadiusLg),
                            bottomEnd:
                                Radius.circular(QafSizes.productImageRadius),
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                              width: QafSizes.iconLg * 1.2,
                              height: QafSizes.iconLg * 1.2,
                              child: Icon(Iconsax.add, color: QafColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
