import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class QafSpacingStyle {
  QafSpacingStyle._();
  static EdgeInsetsDirectional paddingWithAppBarHeight =
      EdgeInsetsDirectional.only(
    top: QafSizes.appBarHeight,
    bottom: QafSizes.defaultSpace,
    start: QafSizes.defaultSpace,
    end: QafSizes.defaultSpace,
  );
}
