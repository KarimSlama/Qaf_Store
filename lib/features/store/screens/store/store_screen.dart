import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/appbar/tabbar.dart';
import 'package:qaf_store/common/widgets/cards/brand_card.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/qaf_search_container.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/store/screens/store/widgets/category_tab.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: QafAppBar(
          title: Text(QafStrings.store,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartCounterIcon(
              iconColor: dark ? QafColors.white : QafColors.dark,
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? QafColors.black : QafColors.white,
                  expandedHeight: 440.h,
                  flexibleSpace: Padding(
                    padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        QafSearchContainer(
                          text: QafStrings.searchInStore,
                          padding: EdgeInsetsDirectional.zero,
                        ),
                        SizedBox(height: QafSizes.spaceBtwSections),
                        SectionHeading(
                            text: QafStrings.featuredBrands, onPressed: () {}),
                        SizedBox(height: QafSizes.spaceBtwItems / 1.5),
                        GridViewLayout(
                            mainAxisExtent: 70,
                            itemCount: 4,
                            itemBuilder: (_, index) =>
                                BrandCard(showBorder: true)),
                      ],
                    ),
                  ),
                  bottom: QafTabBar(
                    tabs: const [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furnitures')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                    ],
                  )),
            ];
          },
          body: TabBarView(
            children: [
              /// Will Modify it later..
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
