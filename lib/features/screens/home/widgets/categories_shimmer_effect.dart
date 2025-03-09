import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class CategoriesShimmerEffect extends StatelessWidget {
  final int itemCount;
  const CategoriesShimmerEffect({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: QafSizes.spaceBtwItems / 2,
              children: [
                QafShimmerEffect(width: 55.w, height: 55.h, radius: 55.r),
                QafShimmerEffect(width: 55.w, height: 8.h),
              ],
            );
          },
          separatorBuilder: (_, __) => SizedBox(width: QafSizes.spaceBtwItems),
          itemCount: itemCount),
    );
  }
}
