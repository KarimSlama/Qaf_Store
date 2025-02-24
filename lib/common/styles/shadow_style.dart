import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class ShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: QafColors.darkGrey.withValues(alpha: .1),
    blurRadius: 50.r,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: QafColors.darkGrey.withValues(alpha: .1),
    blurRadius: 50.r,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
