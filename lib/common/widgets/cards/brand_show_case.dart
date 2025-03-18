import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/cards/brand_card.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class BrandShowCase extends StatelessWidget {
  final BrandModel brandModel;
  final List<String> images;
  const BrandShowCase(
      {super.key, required this.images, required this.brandModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.brandProductsScreen, arguments: brandModel);
      },
      child: RoundedContainer(
        showBorder: true,
        borderColor: QafColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin:
            const EdgeInsetsDirectional.only(bottom: QafSizes.spaceBtwItems),
        padding: const EdgeInsetsDirectional.all(QafSizes.md),
        child: Column(
          children: [
            BrandCard(
              showBorder: false,
              brands: brandModel,
            ),
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context, true))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(image, context, bool isNetworkImage) {
    return Expanded(
      child: RoundedContainer(
        height: 100.h,
        padding: const EdgeInsetsDirectional.all(QafSizes.md),
        margin: const EdgeInsetsDirectional.all(QafSizes.sm),
        backgroundColor: QafHelperFunctions.isDark(context)
            ? QafColors.darkGrey
            : QafColors.light,
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, progress) =>
                    QafShimmerEffect(width: 55.w, height: 55.h),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : Image(
                fit: BoxFit.contain,
                image: AssetImage(image),
              ),
      ),
    );
  }
}
