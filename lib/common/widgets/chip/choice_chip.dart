import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/circular_containter.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class QafChoiceChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function(bool)? onSelected;
  const QafChoiceChip(
      {super.key,
      required this.text,
      required this.isSelected,
      this.onSelected});

  @override
  Widget build(BuildContext context) {
    final isColor = QafHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      labelStyle: TextStyle(color: isSelected ? QafColors.white : null),
      selected: isSelected,
      onSelected: onSelected,
      avatar: isColor
          ? CircularContainter(
              width: 60.w,
              height: 60.h,
              backgroundColor: QafHelperFunctions.getColor(text)!)
          : null,
      backgroundColor: isColor ? QafHelperFunctions.getColor(text)! : null,
      labelPadding: isColor ? EdgeInsetsDirectional.all(0) : null,
      padding: isColor ? EdgeInsetsDirectional.all(0) : null,
      shape: isColor ? CircleBorder() : null,
    );
  }
}
