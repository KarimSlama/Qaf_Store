import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: QafSizes.spaceBtwItems,
      children: [
        SizedBox(width: 60.w),
        CircularIcon(
          icon: Iconsax.minus,
          backgroundColor: dark ? QafColors.darkGrey : QafColors.light,
          width: 40.w,
          height: 40.h,
          color: dark ? QafColors.white : QafColors.black,
        ),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        CircularIcon(
          icon: Iconsax.add,
          backgroundColor: QafColors.primary,
          width: 40.w,
          height: 40.h,
          color: QafColors.white,
        ),
      ],
    );
  }
}
