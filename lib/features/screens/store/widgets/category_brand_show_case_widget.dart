import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/cards/brand_show_case.dart';
import 'package:qaf_store/common/widgets/shimmer/list_title_shimmer.dart';
import 'package:qaf_store/features/screens/brands/controller/cubit/brand_cubit.dart';
import 'package:qaf_store/features/screens/brands/controller/cubit/brand_state.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class CategoryBrandShowCaseWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryBrandShowCaseWidget({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      bloc: getIt<BrandCubit>()..fetchBrandForCategory(categoryModel.id),
      builder: (context, state) {
        return state.maybeWhen(
          brandsForCategoryLoading: () => const ListTitleShimmerEffect(),
          brandsForCategoryLoaded: (brands) {
            if (brands.isEmpty) {
              return const SizedBox.shrink();
            }
            
            return ListView.builder(
              itemCount: brands.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final brand = brands[index];
                return BrandShowCase(
                  images: const [],
                  brandModel: brand,
                );
              },
            );
          },
          error: (error) => Text(error.toString()),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
