import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/images/circular_image.dart';
import 'package:qaf_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/utils/constants/constants.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  final ProductModel product;
  const ProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    final salePrecentage =
        Constants.calculateSalePrecentage(product.price, product.salePrice);
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
                '$salePrecentage %',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: QafColors.black),
              ),
            ),

            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                product.price.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            ProductPriceText(
                price: Constants.getProductPrice(product), isLarge: true),
          ],
        ),
        ProductTitleText(title: product.title),
        Row(
          spacing: QafSizes.spaceBtwItems,
          children: [
            ProductTitleText(title: QafStrings.status),
            Text(
              Constants.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          spacing: QafSizes.defaultSpace / 3,
          children: [
            CircularImage(
              image: product.brand!= null ? product.brand!.image : '',
              width: 32.w,
              height: 32.h,
              overlayColor: dark ? QafColors.white : QafColors.black,
            ),
            BrandTitleTextWithVerificationIcon(
                title: product.brand!.name, brandTextSize: TextSizes.MEDIUM),
          ],
        )
      ],
    );
  }
}
