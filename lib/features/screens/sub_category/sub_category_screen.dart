import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/common/widgets/products/product_cards/horizontal_product_card.dart';
import 'package:qaf_store/common/widgets/shimmer/product_shimmer_effect.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class SubCategoryScreen extends StatelessWidget {
  final CategoryModel category;
  const SubCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(category.name,
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: getIt<ProductCubit>()
          ..fetchProductsForCategory(categoryId: category.id),
        builder: (context, state) {
          return state.maybeWhen(
            categoryProductsLoading: () => ProductShimmerEffect(),
            categoryProductsSuccess: (products) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
                  child: Column(
                    spacing: QafSizes.spaceBtwSections,
                    children: [
                      RoundedImage(
                        imageUrl: Assets.images.products.promoBanner1.path,
                        width: double.infinity,
                        applyImageRadius: true,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: products.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => Column(
                          spacing: QafSizes.spaceBtwItems / 2,
                          children: [
                            SectionHeading(
                                text: category.name, onPressed: () {}),
                            SizedBox(
                              height: 120.h,
                              child: ListView.separated(
                                itemCount: products.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (_, __) =>
                                    SizedBox(width: QafSizes.spaceBtwItems),
                                itemBuilder: (_, index) =>
                                    HorizontalProductCard(
                                        product: products[index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            categoryProductsError: (error) => Text(error),
            orElse: () => SizedBox(),
          );
        },
      ),
    );
  }
}
