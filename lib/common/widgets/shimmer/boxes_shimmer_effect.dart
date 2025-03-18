import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class BoxesShimmerEffect extends StatelessWidget {
  const BoxesShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: QafSizes.spaceBtwItems,
      children: [
        Expanded(child: QafShimmerEffect(width: 150, height: 110)),
        Expanded(child: QafShimmerEffect(width: 150, height: 110)),
        Expanded(child: QafShimmerEffect(width: 150, height: 110)),
      ],
    );
  }
}
