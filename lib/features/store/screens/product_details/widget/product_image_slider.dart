import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
              child: Container(
                color: QafHelperFunctions.isDark(context) ? QafColors.darkerGrey : QafColors.light,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 400.h,
                      child: Padding(
                        padding:
                            EdgeInsets.all(QafSizes.productImageRadius * 2),
                        child: Image(
                            image: AssetImage(
                                Assets.images.products.bedroomBed.path)),
                      ),
                    ),
                    PositionedDirectional(
                      end: 0,
                      start: QafSizes.defaultSpace,
                      bottom: 30,
                      child: SizedBox(
                        height: 80.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: QafSizes.spaceBtwItems),
                          itemBuilder: (_, index) => RoundedImage(
                            imageUrl:
                                Assets.images.products.bedroomBedGrey.path,
                            width: 80.w,
                            backgroundColor:
                                QafHelperFunctions.isDark(context) ? QafColors.dark : QafColors.white,
                            border: Border.all(color: QafColors.primary),
                            padding: EdgeInsetsDirectional.all(QafSizes.sm),
                          ),
                        ),
                      ),
                    ),
                    const QafAppBar(
                      showBackArrow: true,
                      actions: [
                        CircularIcon(icon: Iconsax.heart, color: Colors.red)
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}