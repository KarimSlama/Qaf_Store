import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/common/widgets/shimmer/categories_shimmer_effect.dart';
import 'package:qaf_store/features/screens/home/widgets/vertical_popular_category_image_text.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class HorizontalHomeCategories extends StatelessWidget {
  const HorizontalHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          current is CategoryLoading ||
          current is CategorySuccess ||
          current is CategoryError,
      builder: (context, state) {
        return state.maybeWhen(
          categoryLoading: () => CategoriesShimmerEffect(itemCount: 2),
          categorySuccess: (categories) {
            return SizedBox(
              height: 85.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => VerticalPopularCategoryImageText(
                    onTap: () => context.pushNamed(Routes.subCategoryScreen),
                    image: categories[index].image,
                    title: categories[index].name),
              ),
            );
          },
          categoryError: (error) => Text(error),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
