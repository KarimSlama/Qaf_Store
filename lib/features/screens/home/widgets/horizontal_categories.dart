import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

import '../../../../common/widgets/shimmer/categories_shimmer_effect.dart';
import '../../../../utils/routings/routes.dart';
import '../controller/cubit/product_cubit.dart';
import '../controller/cubit/product_state.dart';
import 'vertical_popular_category_image_text.dart';

class HorizontalHomeCategories extends StatelessWidget {
  const HorizontalHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) {
        if (previous is! ProductDataState || current is! ProductDataState) {
          return true;
        }
        return previous.categories != current.categories ||
            previous.isCategoriesLoading != current.isCategoriesLoading ||
            previous.categoriesError != current.categoriesError;
      },
      builder: (context, state) {
        if (state is! ProductDataState) return const SizedBox.shrink();

        if (state.isCategoriesLoading) {
          return const CategoriesShimmerEffect(itemCount: 5);
        }

        if (state.categoriesError != null) {
          return Text(state.categoriesError!);
        }

        if (state.categories == null || state.categories!.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 85.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.categories!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => VerticalPopularCategoryImageText(
                onTap: () => context.pushNamed(Routes.subCategoryScreen,
                    arguments: state.categories![index]),
                image: state.categories![index].image,
                title: state.categories![index].name),
          ),
        );
      },
    );
  }
}
