import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class RoundedContainer extends StatelessWidget {
  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsDirectional? padding, margin;

  const RoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = QafSizes.borderRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = QafColors.borderPrimary,
      this.backgroundColor = QafColors.white,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: QafColors.borderPrimary) : null,
      ),
      child: child,
    );
  }
}
