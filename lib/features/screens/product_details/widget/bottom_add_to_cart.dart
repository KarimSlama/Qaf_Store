import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: QafSizes.defaultSpace,
          vertical: QafSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(QafSizes.cardRadiusLg),
          topEnd: Radius.circular(QafSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: QafSizes.spaceBtwItems,
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: QafColors.darkGrey,
                width: 40.w,
                height: 40.h,
                color: QafColors.white,
              ),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              CircularIcon(
                icon: Iconsax.add,
                backgroundColor: QafColors.black,
                width: 40.w,
                height: 40.h,
                color: QafColors.white,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsetsDirectional.all(QafSizes.md),
                  backgroundColor: QafColors.black,
                  side: const BorderSide(color: QafColors.black)),
              child: Text(QafStrings.addToCart)),
        ],
      ),
    );
  }
}
