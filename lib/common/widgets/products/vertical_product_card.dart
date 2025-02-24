import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/styles/shadow_style.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180.w,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(QafSizes.productImageRadius),
          color: dark ? QafColors.darkGrey : QafColors.white,
        ),
        child: Column(
          spacing: 10.h,
          children: [
            RoundedContainer(
              height: 180.h,
              padding: const EdgeInsetsDirectional.all(8),
              backgroundColor: dark ? QafColors.dark : QafColors.light,
              child: Stack(
                children: [
                  RoundedImage(
                    imageUrl:
                        Assets.images.products.nikeAirJordonwhiteMagenta.path,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: 8.r,
                      backgroundColor:
                          QafColors.secendary.withValues(alpha: .8),
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: QafColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.h,
                children: [
                  ProductTitleText(
                      title: 'Red Nike Air shoes', smallSize: true),
                  Row(
                    spacing: 10.w,
                    children: [
                      Text('Nike',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium),
                      Icon(
                        Iconsax.verify,
                        size: QafSizes.iconXs,
                        color: QafColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8),
                  child: ProductPriceText(price: '50'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: QafColors.dark,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(QafSizes.borderRadiusLg),
                      bottomEnd: Radius.circular(QafSizes.productImageRadius),
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
    );
  }
}
