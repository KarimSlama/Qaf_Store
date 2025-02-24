import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/enum.dart';

class BrandTitleText extends StatelessWidget {
  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  const BrandTitleText({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.color,
    this.textAlign = TextAlign.left,
    this.brandTextSize = TextSizes.SMALL,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.SMALL
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.MEDIUM
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.LARGE
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
