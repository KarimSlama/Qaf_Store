import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/chip/choice_chip.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/texts/product_price_text.dart';
import 'package:qaf_store/common/widgets/texts/product_title_text.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/product_details/controller/cubit/product_details_cubit.dart';
import 'package:qaf_store/utils/constants/constants.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class ProductAttribute extends StatelessWidget {
  final ProductModel product;
  const ProductAttribute({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    final productCubit = context.read<ProductDetailsCubit>();

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
                  SectionHeading(
                      text: QafStrings.variation, isActionButton: false),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: QafSizes.defaultSpace / 3,
                    children: [
                      Row(
                        spacing: QafSizes.spaceBtwItems,
                        children: [
                          ProductTitleText(
                              title: '${QafStrings.price} :', smallSize: true),
                        
                          if (productCubit.productVariationModel.salePrice > 0)
                            Text(
                              '\$${productCubit.productVariationModel.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),
                          ProductPriceText(
                            price: productCubit.getVariationPrice(),
                          ),
                        ],
                      ),
                      Row(
                        spacing: QafSizes.spaceBtwItems,
                        children: [
                          ProductTitleText(
                              title: QafStrings.status, smallSize: true),
                          Text(
                            Constants.getProductStockStatus(product.stock),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ProductTitleText(
                title: product.description ?? '',
                smallSize: true,
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map(
                (attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: QafSizes.spaceBtwItems / 2,
                  children: [
                    SectionHeading(
                        text: attribute.name ?? '', isActionButton: false),
                    Wrap(
                        spacing: 8,
                        children: attribute.values!.map((attributeValue) {
                          final isSelected =
                              productCubit.selectedAttributes[attribute.name] ==
                                  attributeValue;
                          final available = productCubit
                              .getAttributesAvailabilityInVariation(
                                  product.productVariation!, attribute.name!)
                              .contains(attributeValue);
                          return QafChoiceChip(
                              text: attributeValue,
                              isSelected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      if (selected && available) {
                                        productCubit.onAttributeSelected(
                                            product,
                                            attribute.name ?? '',
                                            attributeValue);
                                      }
                                    }
                                  : null);
                        }).toList()),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
