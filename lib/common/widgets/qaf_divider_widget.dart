import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class QafDividerWidget extends StatelessWidget {
  final String dividerText;
  const QafDividerWidget({super.key, required this.dividerText});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? QafColors.darkGrey : QafColors.dark,
            thickness: .5.h,
            indent: 60,
            endIndent: 4,
          ),
        ),
        Text(dividerText,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: dark ? QafColors.darkGrey : QafColors.dark,
            thickness: .5.h,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
