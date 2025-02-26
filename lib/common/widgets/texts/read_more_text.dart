import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:readmore/readmore.dart';

class QafReadMoreText extends StatelessWidget {
  final String text;
  final int lines;

  const QafReadMoreText({super.key, required this.text, required this.lines});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: lines,
      trimMode: TrimMode.Line,
      trimExpandedText: QafStrings.showLess,
      trimCollapsedText: QafStrings.showMore,
      moreStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
          color: QafColors.primary),
      lessStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
          color: QafColors.primary),
    );
  }
}
