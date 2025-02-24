import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final double? width, height, size;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const CircularIcon(
      {super.key,
      required this.icon,
      this.width,
      this.height,
      this.size = QafSizes.iconMd,
      this.color,
      this.backgroundColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Positioned(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: dark
              ? QafColors.black.withValues(alpha: .9)
              : QafColors.white.withValues(alpha: .9),
        ),
        child: IconButton(
            onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
      ),
    );
  }
}
