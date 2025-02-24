import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class VerticalPopularCategoryImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  const VerticalPopularCategoryImageText(
      {super.key,
      required this.image,
      required this.title,
      this.textColor = QafColors.white,
      this.backgroundColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 14),
        child: Column(
          spacing: 7.h,
          children: [
            Container(
              width: 56.w,
              height: 56.h,
              padding: EdgeInsetsDirectional.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: backgroundColor ??
                    (dark ? QafColors.black : QafColors.white),
              ),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                color: dark ? QafColors.light : QafColors.dark,
              ),
            ),
            SizedBox(
              width: 55.w,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
