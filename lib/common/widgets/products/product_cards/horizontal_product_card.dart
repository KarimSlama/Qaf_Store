import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/common/widgets/products/favorite_icon.dart';
import 'package:qaf_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/wishlist/controller/cubit/favorite_cubit.dart';
import 'package:qaf_store/utils/constants/constants.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class HorizontalProductCard extends StatelessWidget {
  final ProductModel product;
  const HorizontalProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final salePrecentage =
        Constants.calculateSalePrecentage(product.price, product.salePrice) ??
            '0';

    final dark = QafHelperFunctions.isDark(context);
    return BlocProvider.value(
      value: getIt<FavoriteCubit>(),
      child: Container(
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
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                      applyImageRadius: true,
                    ),
                  ),
                  PositionedDirectional(
                    top: 12,
                    child: RoundedContainer(
                      radius: QafSizes.sm,
                      backgroundColor:
                          QafColors.secendary.withValues(alpha: .8),
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
                  ),
                  PositionedDirectional(
                    top: 0,
                    end: 0,
                    child: FavoriteIcon(productId: product.id),
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
                          title: product.title,
                          smallSize: true,
                        ),
                        BrandTitleTextWithVerificationIcon(
                          title: product.brand!.name,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              if (product.productType ==
                                      ProductType.single.toString() &&
                                  product.salePrice > 0)
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8),
                                  child: Text(
                                    product.price.toString(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 8),
                                child: ProductPriceText(
                                  price: Constants.getProductPrice(product),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: QafColors.dark,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart:
                                  Radius.circular(QafSizes.borderRadiusLg),
                              bottomEnd:
                                  Radius.circular(QafSizes.productImageRadius),
                            ),
                          ),
                          child: Center(
                            child: SizedBox(
                                width: QafSizes.iconLg * 1.2,
                                height: QafSizes.iconLg * 1.2,
                                child:
                                    Icon(Iconsax.add, color: QafColors.white)),
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
      ),
    );
  }
}
