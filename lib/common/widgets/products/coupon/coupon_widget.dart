import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? QafColors.dark : QafColors.white,
      padding: EdgeInsetsDirectional.only(
        top: QafSizes.sm,
        bottom: QafSizes.sm,
        start: QafSizes.md,
        end: QafSizes.sm,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: QafStrings.haveAPromoCodeEnterHere,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? QafColors.white.withValues(alpha: .5)
                        : QafColors.dark.withValues(alpha: .5),
                    backgroundColor: QafColors.grey.withValues(alpha: .2),
                    side: BorderSide(
                        color: QafColors.grey.withValues(alpha: .1))),
                onPressed: () {},
                child: Text(QafStrings.apply)),
          )
        ],
      ),
    );
  }
}
