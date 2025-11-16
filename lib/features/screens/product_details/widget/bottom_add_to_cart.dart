import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class BottomAddToCart extends StatefulWidget {
  final ProductModel productModel;
  const BottomAddToCart({super.key, required this.productModel});

  @override
  State<BottomAddToCart> createState() => _BottomAddToCartState();
}

class _BottomAddToCartState extends State<BottomAddToCart> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cartCubit = getIt<CartCubit>();
      if (widget.productModel.productType == ProductType.single.toString()) {
        cartCubit.resetSelectedAttributes();
      }
      cartCubit.updateAlreadyAddedProductCount(widget.productModel);
    });
  }

  @override
  void didUpdateWidget(BottomAddToCart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.productModel.id != widget.productModel.id) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final cartCubit = getIt<CartCubit>();
        if (widget.productModel.productType == ProductType.single.toString()) {
          cartCubit.resetSelectedAttributes();
        }
        cartCubit.updateAlreadyAddedProductCount(widget.productModel);
      });
    }
  }

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
          buildWhen: (previous, current) =>
              previous.productQuantityInCart != current.productQuantityInCart,
          builder: (context, state) {
            final cartCubit = context.read<CartCubit>();
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
                          if (state.productQuantityInCart > 0) {
                            cartCubit.updateProductQuantity(
                                state.productQuantityInCart - 1);
                          }
                        }),
                    Text('${state.productQuantityInCart}',
                        style: Theme.of(context).textTheme.titleSmall),
                    CircularIcon(
                      icon: Iconsax.add,
                      backgroundColor: QafColors.black,
                      width: 40.w,
                      height: 40.h,
                      color: QafColors.white,
                      onPressed: () => cartCubit.updateProductQuantity(
                          state.productQuantityInCart + 1),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: state.productQuantityInCart < 1
                        ? null
                        : () =>
                            cartCubit.addToCart(widget.productModel, context),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsetsDirectional.all(QafSizes.md),
                        backgroundColor: QafColors.primary,
                        disabledBackgroundColor: QafColors.buttonDisabled,
                        foregroundColor: QafColors.white,
                        disabledForegroundColor: QafColors.white,
                        side: BorderSide(
                            color: state.productQuantityInCart < 1
                                ? QafColors.buttonDisabled
                                : QafColors.primary)),
                    child: Text(QafStrings.addToCart)),
              ],
            );
          },
        ),
      ),
    );
  }
}
