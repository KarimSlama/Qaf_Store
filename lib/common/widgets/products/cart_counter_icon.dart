import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class CartCounterIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Color iconColor;
  const CartCounterIcon(
      {super.key, required this.onPressed, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        PositionedDirectional(
          end: 0,
          child: Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: QafColors.black),
            child: Center(
                child: Text(
              '10',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: QafColors.white, fontSizeFactor: .8),
            )),
          ),
        ),
      ],
    );
  }
}
