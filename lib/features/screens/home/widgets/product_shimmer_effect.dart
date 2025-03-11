import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class ProductShimmerEffect extends StatelessWidget {
  final int itemCount;
  const ProductShimmerEffect({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return GridViewLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => SizedBox(
        width: 180.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: QafSizes.spaceBtwItems,
          children: [
            QafShimmerEffect(width: 180.w, height: 180.h),
            QafShimmerEffect(width: 160.w, height: 15.h),
            QafShimmerEffect(width: 110.w, height: 15.h),
          ],
        ),
      ),
    );
  }
}
