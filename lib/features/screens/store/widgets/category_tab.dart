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
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwItems,
            children: [
              CategoryBrandShowCaseWidget(categoryModel: categoryModel),
              BlocBuilder<ProductCubit, ProductState>(
                bloc: getIt<ProductCubit>()
                  ..fetchProductForCategory(categoryModel.id),
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => SizedBox(),
                    categoryProductsLoading: () => ProductShimmerEffect(),
                    categoryProductsSuccess: (products) {
                      return Column(
                        spacing: QafSizes.spaceBtwItems,
                        children: [
                          SectionHeading(
                            text: QafStrings.youMightLike,
                            onPressed: () {},
                          ),
                          GridViewLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) => VerticalProductCard(
                              index: index,
                              products: products,
                            ),
                          ),
                        ],
                      );
                    },
                    categoryError: (error) => Text(error.toString()),
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
