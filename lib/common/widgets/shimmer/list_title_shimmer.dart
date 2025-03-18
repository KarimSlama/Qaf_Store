import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class ListTitleShimmerEffect extends StatelessWidget {
  final int itemCount;
  const ListTitleShimmerEffect({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: QafSizes.spaceBtwItems,
      children: [
        Row(
          children: [
            QafShimmerEffect(width: 50, height: 50, radius: 50),
            Column(
              spacing: QafSizes.spaceBtwItems / 2,
              children: [
                QafShimmerEffect(width: 100, height: 15),
                QafShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        ),
      ],
    );
  }
}
