import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/cards/brand_card.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/brands/controller/cubit/brand_cubit.dart';
import 'package:qaf_store/features/screens/brands/controller/cubit/brand_state.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class StoreBlocBuilder extends StatelessWidget {
  const StoreBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      builder: (context, state) {
        return state.maybeWhen(
          brandsLoading: () => const QafShimmerEffect(width: 180, height: 180),
          brandsLoaded: (brands) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeading(
                  text: QafStrings.brands,
                  isActionButton: true,
                  onPressed: () => context.pushNamed(Routes.allBrandsScreen,
                      arguments: brands),
                ),
                SizedBox(height: QafSizes.spaceBtwItems),
                GridViewLayout(
                  itemCount: 4,
                  mainAxisExtent: 70,
                  itemBuilder: (_, index) {
                    final brand = brands[index];
                    return BrandCard(
                      brands: brand,
                      showBorder: true,
                      onTap: () => context.pushNamed(
                        Routes.brandProductsScreen,
                        arguments: brand,
                      ),
                    );
                  },
                ),
              ],
            );
          },
          error: (error) => Center(child: Text(error)),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
