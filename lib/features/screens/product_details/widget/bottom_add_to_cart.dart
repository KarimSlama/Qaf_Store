import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class BottomAddToCart extends StatelessWidget {
  final ProductModel productModel;
  const BottomAddToCart({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartCubit>(),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: QafSizes.defaultSpace,
            vertical: QafSizes.defaultSpace / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(QafSizes.cardRadiusLg),
            topEnd: Radius.circular(QafSizes.cardRadiusLg),
          ),
        ),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartCubit = context.watch<CartCubit>();
            cartCubit.updateAlreadyAddedProductCount(productModel);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: QafSizes.spaceBtwItems,
                  children: [
                    CircularIcon(
                        icon: Iconsax.minus,
                        backgroundColor: QafColors.darkGrey,
                        width: 40.w,
                        height: 40.h,
                        color: QafColors.white,
                        onPressed: () {
                          if (cartCubit.productQuantityInCart > 0) {
                            cartCubit.updateProductQuantity(
                                cartCubit.productQuantityInCart - 1);
                          }
                        }),
                    Text('${cartCubit.productQuantityInCart}',
                        style: Theme.of(context).textTheme.titleSmall),
                    CircularIcon(
                      icon: Iconsax.add,
                      backgroundColor: QafColors.black,
                      width: 40.w,
                      height: 40.h,
                      color: QafColors.white,
                      onPressed: () => cartCubit.updateProductQuantity(
                          cartCubit.productQuantityInCart + 1),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: cartCubit.productQuantityInCart < 1
                        ? null
                        : () => cartCubit.addToCart(productModel, context),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsetsDirectional.all(QafSizes.md),
                        backgroundColor: QafColors.black,
                        side: const BorderSide(color: QafColors.black)),
                    child: Text(QafStrings.addToCart)),
              ],
            );
          },
        ),
      ),
    );
  }
}
