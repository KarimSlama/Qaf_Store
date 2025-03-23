import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/styles/shadow_style.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/common/widgets/products/favorite_icon.dart';
import 'package:qaf_store/common/widgets/products/product_cards/product_card_add_to_cart_button.dart';
import 'package:qaf_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/wishlist/controller/cubit/favorite_cubit.dart';
import 'package:qaf_store/utils/constants/constants.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class VerticalProductCard extends StatelessWidget {
  final List<ProductModel> products;
  final int index;
  const VerticalProductCard(
      {super.key, required this.index, required this.products});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    final salePrecentage = Constants.calculateSalePrecentage(
            products[index].price, products[index].salePrice) ??
        '0';
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<FavoriteCubit>(),
        ),
        BlocProvider.value(
          value: getIt<CartCubit>(),
        ),
      ],
      child: GestureDetector(
        onTap: () => context.pushNamed(Routes.productDetailScreen,
            arguments: products[index]),
        child: Container(
          width: 180.w,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(QafSizes.productImageRadius),
            color: dark ? QafColors.darkGrey : QafColors.white,
          ),
          child: Column(
            children: [
              RoundedContainer(
                height: 170.h,
                padding: const EdgeInsetsDirectional.all(8),
                backgroundColor: dark ? QafColors.dark : QafColors.light,
                child: Stack(
                  children: [
                    RoundedImage(
                      imageUrl: products[index].thumbnail,
                      isNetworkImage: true,
                      applyImageRadius: true,
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
                      child: FavoriteIcon(productId: products[index].id),
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
                      title: products[index].title,
                      smallSize: true,
                    ),
                    BrandTitleTextWithVerificationIcon(
                      title: products[index].brand!.name,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        if (products[index].productType ==
                                ProductType.single.toString() &&
                            products[index].salePrice > 0)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8),
                            child: Text(
                              products[index].price.toString(),
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8),
                          child: ProductPriceText(
                            price: Constants.getProductPrice(products[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProductCardAddToCartButton(product: products[index]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
