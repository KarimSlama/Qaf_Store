import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Column(
      spacing: QafSizes.spaceBtwItems / 2,
      children: [
        SectionHeading(
          text: QafStrings.paymentMethod,
          buttonText: QafStrings.change,
          isActionButton: true,
          onPressed: () {},
        ),
        Row(
          spacing: QafSizes.spaceBtwItems / 2,
          children: [
            RoundedContainer(
              width: 60.w,
              height: 35.h,
              padding: EdgeInsetsDirectional.all(QafSizes.sm),
              backgroundColor: dark ? QafColors.light : QafColors.white,
              child: Image.asset(Assets.icons.paymentMethods.paypal.path,
                  fit: BoxFit.contain),
            ),
            Text(QafStrings.paypal,
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
