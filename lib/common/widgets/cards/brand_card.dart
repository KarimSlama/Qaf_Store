import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/images/circular_image.dart';
import 'package:qaf_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class BrandCard extends StatelessWidget {
  final bool showBorder;
  final void Function()? onTap;
  const BrandCard({super.key, required this.showBorder, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = QafHelperFunctions.isDark(context);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsetsDirectional.all(QafSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: CircularImage(
                image: Assets.icons.brands.nike.path,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? QafColors.white : QafColors.black,
              ),
            ),
            Expanded(
              child: Column(
                spacing: 5.h,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BrandTitleTextWithVerificationIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.LARGE,
                  ),
                  Text(
                    '265 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
