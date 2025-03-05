import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/common/widgets/products/product_cards/horizontal_product_card.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text('Sports', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwSections,
            children: [
              RoundedImage(
                imageUrl: Assets.images.banners.banner3.path,
                width: double.infinity,
                applyImageRadius: true,
              ),
              Column(
                spacing: QafSizes.spaceBtwItems / 2,
                children: [
                  SectionHeading(text: 'Sports Shirts', onPressed: () {}),
                  SizedBox(
                    height: 120.h,
                    child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) =>
                          SizedBox(width: QafSizes.spaceBtwItems),
                      itemBuilder: (_, index) => HorizontalProductCard(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
