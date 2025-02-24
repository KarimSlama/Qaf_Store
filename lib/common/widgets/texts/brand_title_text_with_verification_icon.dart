import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/texts/brand_title_text.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class BrandTitleTextWithVerificationIcon extends StatelessWidget {
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  const BrandTitleTextWithVerificationIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = QafColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.SMALL,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10.w,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        Icon(
          Iconsax.verify5,
          size: QafSizes.iconXs,
          color: iconColor,
        ),
      ],
    );
  }
}
