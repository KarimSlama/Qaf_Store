import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class CircularImage extends StatelessWidget {
  final double width, height, padding;
  final Color? backgroundColor;
  final Color? overlayColor;
  final String image;
  final BoxFit? fit;
  final bool isNetworkImage;

  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = QafSizes.sm,
    this.backgroundColor,
    this.overlayColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsetsDirectional.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? QafColors.black : QafColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, progress) =>
                      QafShimmerEffect(width: 55.w, height: 55.h),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
