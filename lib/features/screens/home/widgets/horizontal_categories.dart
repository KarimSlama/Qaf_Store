import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/home_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/home_state.dart';
import 'package:qaf_store/features/screens/home/widgets/categories_shimmer_effect.dart';
import 'package:qaf_store/features/screens/home/widgets/vertical_popular_category_image_text.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class HorizontalHomeCategories extends StatelessWidget {
  const HorizontalHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        print('current state in horizontal categories is $state');
        print('rebild category');
        return state.maybeWhen(
          categoryLoading: () => CategoriesShimmerEffect(itemCount: 2),
          categorySuccess: (categories) {
            print('rebild category ${categories[0].name}');
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
