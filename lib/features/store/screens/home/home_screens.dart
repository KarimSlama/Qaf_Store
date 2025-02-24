import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/qaf_search_container.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/products/vertical_product_card.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/store/screens/home/widgets/horizontal_categories.dart';
import 'package:qaf_store/features/store/screens/home/widgets/promo_sliders.dart';
import 'package:qaf_store/features/store/screens/home/widgets/qaf_home_appbar.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderWidget(
              child: Column(
                spacing: 22.h,
                children: [
                  QafHomeAppbar(),
                  QafSearchContainer(text: QafStrings.searchInStore),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: QafSizes.defaultSpace),
                    child: Column(
                      spacing: 18.h,
                      children: [
                        SectionHeading(
                          text: QafStrings.popularCategories,
                          textColor: QafColors.white,
                          isActionButton: false,
                        ),
                        HorizontalHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(QafSizes.defaultSpace),
              child: Column(
                spacing: 16.h,
                children: [
                  PromoSliders(
                    banners: [
                      Assets.images.products.promoBanner1.path,
                      Assets.images.products.promoBanner2.path,
                      Assets.images.products.promoBanner3.path,
                    ],
                  ),
                  SectionHeading(
                      text: QafStrings.popularProducts, onPressed: () {}),
                  GridViewLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => VerticalProductCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
