import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/store/screens/product_details/widget/bottom_add_to_cart.dart';
import 'package:qaf_store/features/store/screens/product_details/widget/product_attribute.dart';
import 'package:qaf_store/features/store/screens/product_details/widget/product_image_slider.dart';
import 'package:qaf_store/features/store/screens/product_details/widget/product_meta_data.dart';
import 'package:qaf_store/features/store/screens/product_details/widget/product_rating_and_share.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(),
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
                  ProductMetaData(),
                  ProductAttribute(),
                  SizedBox(height: QafSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text(QafStrings.checkout)),
                  ),
                  SizedBox(height: QafSizes.spaceBtwItems),
                  SectionHeading(text: QafStrings.description, isActionButton: false),
                  ReadMoreText(
                    'More Air, less bulk. The Dn8 takes our Dynamic Air system and condenses it into a sleek, low-profile package. Powered by eight pressurised Air tubes, it gives you a responsive sensation with every step. Enter an unreal experience of movement.\n More Air, less bulk. The Dn8 takes our Dynamic Air system and condenses it into a sleek, low-profile package. Powered by eight pressurised Air tubes, it gives you a responsive sensation with every step. Enter an unreal experience of movement. \n More Air, less bulk. The Dn8 takes our Dynamic Air system and condenses it into a sleek, low-profile package. Powered by eight pressurised Air tubes, it gives you a responsive sensation with every step. Enter an unreal experience of movement.',
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: QafStrings.showMore,
                    trimExpandedText: QafStrings.less,
                    moreStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
                    lessStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
                  ),
                  Divider(),
                  SectionHeading(text: '${QafStrings.reviews} (200)', onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(),
    );
  }
}
