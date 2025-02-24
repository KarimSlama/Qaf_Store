import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class CircularContainter extends StatelessWidget {
  final Widget? child;
  final double width, height;
  final double radius;
  final double padding;
  final EdgeInsetsDirectional? margin;
  final Color backgroundColor;

  const CircularContainter(
      {super.key,
      this.child,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.margin,
      this.backgroundColor = QafColors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsetsDirectional.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
