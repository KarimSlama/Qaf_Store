import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/qaf_search_container.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/home/widgets/horizontal_categories.dart';
import 'package:qaf_store/features/screens/home/widgets/product_cards.dart';
import 'package:qaf_store/features/screens/home/widgets/promo_sliders.dart';
import 'package:qaf_store/features/screens/home/widgets/qaf_home_appbar.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: QafHelperFunctions.isDark(context)
              ? QafColors.light
              : QafColors.dark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r)),
          onPressed: () => context.pushNamed(Routes.customerServiceScreen),
          child: Icon(
            Iconsax.messages_2,
            color: QafHelperFunctions.isDark(context)
                ? QafColors.dark
                : QafColors.light,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderWidget(
              child: Column(
                spacing: 22.h,
                children: [
                  QafHomeAppbar(),
                  QafSearchContainer(
                    text: QafStrings.searchInStore,
                  ),
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
                        SizedBox(height: QafSizes.spaceBtwSections),
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
                  PromoSliders(),
                  SectionHeading(
                      text: QafStrings.popularProducts,
                      onPressed: () =>
                          context.pushNamed(Routes.allProductsScreen)),
                  ProductCards(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
