import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/products/cart_counter_icon.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class QafHomeAppbar extends StatelessWidget {
  const QafHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return QafAppBar(
      title: Column(
        spacing: 7.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            QafStrings.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: QafColors.grey),
          ),
          Text(
            QafStrings.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: QafColors.white),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          iconColor: QafColors.white,
          onPressed: () {},
        )
      ],
    );
  }
}
