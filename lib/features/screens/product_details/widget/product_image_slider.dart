import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/common/widgets/images/rounded_image.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/product_details/controller/cubit/product_details_cubit.dart';
import 'package:qaf_store/features/screens/product_details/controller/cubit/product_details_state.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  final ProductModel product;
  const ProductImageSlider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    final images = cubit.getAllProductsImages(product);
    return CurvedEdgeWidget(
      child: Container(
        color: QafHelperFunctions.isDark(context)
            ? QafColors.darkerGrey
            : QafColors.light,
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            return Stack(
              children: [
                SizedBox(
                  height: 400.h,
                  child: Padding(
                    padding: EdgeInsets.all(QafSizes.productImageRadius * 2),
                    child: GestureDetector(
                      onTap: () => showEnlargedImage(
                          cubit.selectedProductImage, context),
                      child: CachedNetworkImage(
                        imageUrl: state.maybeWhen(
                          success: (image) => cubit.updateSelectedImage(image),
                          orElse: () => cubit.selectedProductImage,
                        ),
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: QafColors.primary,
                        ),
                      ),
                    ),
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
                      itemCount: images.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(width: QafSizes.spaceBtwItems),
                      itemBuilder: (_, index) {
                        final imageSelected =
                            cubit.selectedProductImage == images[index];

                        return RoundedImage(
                          imageUrl: images[index],
                          isNetworkImage: true,
                          onPressed: () {
                            cubit.selectedProductImage = context
                                .read<ProductDetailsCubit>()
                                .updateSelectedImage(images[index]);
                          },
                          width: 80.w,
                          backgroundColor: QafHelperFunctions.isDark(context)
                              ? QafColors.dark
                              : QafColors.white,
                          border: Border.all(
                              color: imageSelected
                                  ? QafColors.primary
                                  : Colors.transparent),
                          padding: EdgeInsetsDirectional.all(QafSizes.sm),
                        );
                      },
                    ),
                  ),
                ),
                const QafAppBar(
                  showBackArrow: true,
                  actions: [
                    CircularIcon(icon: Iconsax.heart, color: Colors.red)
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void showEnlargedImage(String image, context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: QafSizes.spaceBtwSections,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    vertical: QafSizes.defaultSpace * 2,
                    horizontal: QafSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: SizedBox(
                  width: 150.w,
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    child: Text('Close'),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
