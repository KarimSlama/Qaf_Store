import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  final ProductModel product;
  const ProductCardAddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem =
              context.read<CartCubit>().convertToCartItem(product, 1);
          context.read<CartCubit>().addOneToCart(cartItem);
        } else {
          context.pushNamed(Routes.productDetailScreen, arguments: product);
        }
      },
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final productQuantityInCart =
              context.read<CartCubit>().getProductQuantityInCart(product.id);
          return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart >= 1
                  ? QafColors.primary
                  : QafColors.dark,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(QafSizes.borderRadiusLg),
                bottomEnd: Radius.circular(QafSizes.productImageRadius),
              ),
            ),
            child: SizedBox(
                width: QafSizes.iconLg * 1.2,
                height: QafSizes.iconLg * 1.2,
                child: Center(
                    child: productQuantityInCart > 0
                        ? Text(
                            productQuantityInCart.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: QafColors.white),
                          )
                        : Icon(Iconsax.add, color: QafColors.white))),
          );
        },
      ),
    );
  }
}
