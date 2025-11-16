import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/product_details/widget/bottom_add_to_cart.dart';
import 'package:qaf_store/features/screens/product_details/widget/product_attribute.dart';
import 'package:qaf_store/features/screens/product_details/widget/product_image_slider.dart';
import 'package:qaf_store/features/screens/product_details/widget/product_meta_data.dart';
import 'package:qaf_store/features/screens/product_details/widget/product_rating_and_share.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel products;
  const ProductDetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(product: products),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: QafSizes.defaultSpace,
                end: QafSizes.defaultSpace,
                bottom: QafSizes.defaultSpace,
              ),
              child: Column(
                spacing: QafSizes.spaceBtwSections / 3,
                children: [
                  ProductRatingAndShare(),
                  ProductMetaData(product: products),
                  if (products.productType == ProductType.variable.toString())
                    ProductAttribute(product: products),
                  SizedBox(height: QafSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            context.pushNamed(Routes.checkoutScreen),
                        child: Text(QafStrings.checkout)),
                  ),
                  SizedBox(height: QafSizes.spaceBtwItems),
                  SectionHeading(
                      text: QafStrings.description, isActionButton: false),
                  ReadMoreText(
                    products.description ?? '',
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: QafStrings.showMore,
                    trimExpandedText: QafStrings.showLess,
                    moreStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
                    lessStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
                  ),
                  Divider(),
                  SectionHeading(
                      text: '${QafStrings.reviews} (200)',
                      onPressed: () =>
                          context.pushNamed(Routes.productReviewScreen)),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(productModel: products),
    );
  }
}
