import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/images/circular_image.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class VerticalPopularCategoryImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  const VerticalPopularCategoryImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = QafColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

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
            CircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              isNetworkImage: isNetworkImage,
              padding: QafSizes.sm * 1,
              backgroundColor: backgroundColor,
              overlayColor: dark ? QafColors.light : QafColors.dark,
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
