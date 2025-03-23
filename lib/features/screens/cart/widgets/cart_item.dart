import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/features/screens/cart/data/model/cart_item_model.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;
  const CartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: QafSizes.spaceBtwItems,
      children: [
        RoundedImage(
          imageUrl: cartItem.image ?? Assets.images.products.product1.path,
          width: 60.w,
          height: 60.h,
          isNetworkImage: true,
          padding: EdgeInsetsDirectional.all(QafSizes.sm),
          backgroundColor: QafHelperFunctions.isDark(context)
              ? QafColors.darkerGrey
              : QafColors.light,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleTextWithVerificationIcon(
                  title: cartItem.brandName ?? ''),
              Flexible(
                child: ProductTitleText(title: cartItem.title, maxLines: 1),
              ),
              Text.rich(
                TextSpan(
                    children: (cartItem.selectedVariation ?? {})
                        .entries
                        .map(
                          (e) => TextSpan(
                            children: [
                              TextSpan(
                                  text: ' ${e.key} ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: ' ${e.value} ',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        )
                        .toList()),
              ),
            ],
          ),
        )
      ],
    );
  }
}
