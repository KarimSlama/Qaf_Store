import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/cards/brand_show_case.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/products/vertical_product_card.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwItems,
            children: [
              BrandShowCase(
                images: [
                  Assets.images.products.leatherJacket1.path,
                  Assets.images.products.leatherJacket2.path,
                  Assets.images.products.leatherJacket3.path,
                ],
              ),
              SectionHeading(
                text: QafStrings.youMightLike,
                onPressed: () {},
              ),
              GridViewLayout(
                itemCount: 4,
                itemBuilder: (_, index) => VerticalProductCard(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
