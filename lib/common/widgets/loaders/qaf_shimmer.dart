import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class QafShimmerEffect extends StatelessWidget {
  final double width, height, radius;
  final Color? color;
  const QafShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);

    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? QafColors.darkerGrey : QafColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
