import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/cards/brand_card.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class BrandShowCase extends StatelessWidget {
  final List<String> images;
  const BrandShowCase({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: QafColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsetsDirectional.only(bottom: QafSizes.spaceBtwItems),
      padding: const EdgeInsetsDirectional.all(QafSizes.md),
      child: Column(
        children: [
          BrandCard(showBorder: false, brands: BrandModel.empty(),),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(image, context) {
    return Expanded(
        child: RoundedContainer(
      height: 100.h,
      padding: const EdgeInsetsDirectional.all(QafSizes.md),
      margin: const EdgeInsetsDirectional.all(QafSizes.sm),
      backgroundColor: QafHelperFunctions.isDark(context)
          ? QafColors.darkGrey
          : QafColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ));
  }
}
