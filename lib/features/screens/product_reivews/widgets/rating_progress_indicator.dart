import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/devices/qaf_device_utility.dart';

class RatingProgressIndicator extends StatelessWidget {
  final String text;
  final double value;
  const RatingProgressIndicator(
      {super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: QafDeviceUtility.getScreenWidth(context) * .8,
            child: LinearProgressIndicator(
              backgroundColor: QafColors.grey,
              minHeight: 9.h,
              value: value,
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(QafColors.primary),
            ),
          ),
        )
      ],
    );
  }
}
