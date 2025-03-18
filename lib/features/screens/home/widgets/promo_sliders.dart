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
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

class PromoSliders extends StatelessWidget {
  const PromoSliders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      bloc: getIt<ProductCubit>()..fetchAllBanners(),
      buildWhen: (previous, current) =>
          current is BannersLoading ||
          current is BannersSuccess ||
          current is BannersError,
      builder: (context, state) {

        return state.maybeWhen(
          bannersLoading: () => QafShimmerEffect(width: 120, height: 80),
          bannersSuccess: (banners) => Column(
            spacing: 20.h,
            children: [
              CarouselSlider(
                items: banners
                    .map((banner) => RoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () =>
                              context.pushNamed(banner.targetScreen),
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
                  for (int i = 0; i < banners.length; i++)
                    CircularContainter(
                        width: 20.w,
                        height: 3.h,
                        margin: EdgeInsetsDirectional.only(start: 5),
                        backgroundColor: banners.length == i
                            ? QafColors.primary
                            : QafColors.light),
                ],
              ),
            ],
          ),
          bannersError: (error) => Text(error),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
