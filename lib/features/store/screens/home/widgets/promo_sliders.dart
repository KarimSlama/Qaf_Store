import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/circular_containter.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/features/store/controllers/home_controller/home_controller.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class PromoSliders extends StatelessWidget {
  final List<String> banners;
  const PromoSliders({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      spacing: 20.h,
      children: [
        CarouselSlider(
          items: banners.map((url) => RoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                CircularContainter(
                    width: 20.w,
                    height: 3.h,
                    margin: EdgeInsetsDirectional.only(start: 5),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? QafColors.primary
                        : QafColors.light),
            ],
          ),
        ),
      ],
    );
  }
}
