import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/circular_containter.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

class PromoSliders extends StatelessWidget {
  const PromoSliders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) {
        if (previous is! ProductDataState || current is! ProductDataState) {
          return true;
        }
        return previous.banners != current.banners ||
            previous.isBannersLoading != current.isBannersLoading ||
            previous.bannersError != current.bannersError;
      },
      builder: (context, state) {
        if (state is! ProductDataState) return const SizedBox.shrink();

        if (state.isBannersLoading) {
          return const QafShimmerEffect(width: 120, height: 80);
        }

        if (state.bannersError != null) {
          return Text(state.bannersError!);
        }

        if (state.banners == null || state.banners!.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          spacing: 20.h,
          children: [
            CarouselSlider(
              items: state.banners!
                  .map((banner) => RoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => context.pushNamed(banner.targetScreen),
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < state.banners!.length; i++)
                  CircularContainter(
                      width: 20.w,
                      height: 3.h,
                      margin: const EdgeInsetsDirectional.only(start: 5),
                      backgroundColor: i == state.banners!.length - 1
                          ? QafColors.primary
                          : QafColors.light),
              ],
            ),
          ],
        );
      },
    );
  }
}