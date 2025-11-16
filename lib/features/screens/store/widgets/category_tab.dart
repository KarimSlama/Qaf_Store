import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:qaf_store/common/widgets/shimmer/product_shimmer_effect.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/features/screens/store/widgets/category_brand_show_case_widget.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class CategoryTab extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryTab({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwItems,
            children: [
              CategoryBrandShowCaseWidget(categoryModel: categoryModel),
              BlocBuilder<ProductCubit, ProductState>(
                bloc: getIt<ProductCubit>()
                  ..fetchProductsForCategory(categoryId: categoryModel.id),
                buildWhen: (previous, current) {
                  if (previous is! ProductDataState ||
                      current is! ProductDataState) {
                    return true;
                  }
                  return previous.categoryProducts !=
                          current.categoryProducts ||
                      previous.isCategoryProductsLoading !=
                          current.isCategoryProductsLoading ||
                      previous.categoryProductsError !=
                          current.categoryProductsError;
                },
                builder: (context, state) {
                  if (state is! ProductDataState) {
                    return const SizedBox.shrink();
                  }

                  // Loading
                  if (state.isCategoryProductsLoading) {
                    return const ProductShimmerEffect();
                  }

                  // Error
                  if (state.categoryProductsError != null) {
                    return Text(state.categoryProductsError!);
                  }

                  // Success
                  if (state.categoryProducts == null ||
                      state.categoryProducts!.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    spacing: QafSizes.spaceBtwItems,
                    children: [
                      SectionHeading(
                        text: QafStrings.youMightLike,
                        onPressed: () {},
                      ),
                      GridViewLayout(
                        itemCount: state.categoryProducts?.length ?? 0,
                        itemBuilder: (_, index) => VerticalProductCard(
                          index: index,
                          products: state.categoryProducts!,
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
