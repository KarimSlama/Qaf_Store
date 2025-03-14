import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/qaf_search_container.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/features/screens/home/widgets/horizontal_categories.dart';
import 'package:qaf_store/features/screens/home/widgets/promo_sliders.dart';
import 'package:qaf_store/features/screens/home/widgets/qaf_home_appbar.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

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
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        productsLoading: () =>
                            QafShimmerEffect(width: 180, height: 180),
                        productsSuccess: (products) {
                          return GridViewLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) => VerticalProductCard(
                              index: index,
                              products: products,
                            ),
                          );
                        },
                        productsError: (error) => Text(error),
                        orElse: () => Text(''),
                      );
                    },
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
