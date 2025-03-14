import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/cards/brand_show_case.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/features/screens/upload_data/controller/cubit/upload_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

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
              BlocBuilder<ProductCubit, ProductState>(
                buildWhen: (previous, current) =>
                    current is ProductLoading ||
                    current is ProductSuccess ||
                    current is ProductError,
                bloc: getIt<ProductCubit>(),
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
    );
  }
}
