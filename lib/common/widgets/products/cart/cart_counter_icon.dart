import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class CartCounterIcon extends StatelessWidget {
  final Color? iconColor, counterBgColor, counterTextColor;

  const CartCounterIcon(
      {super.key, this.iconColor, this.counterBgColor, this.counterTextColor});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          cartUpdated: (cartItems) => true,
          orElse: () => false,
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            IconButton(
                onPressed: () => context.pushNamed(Routes.cartScreen),
                icon: Icon(Iconsax.shopping_bag, color: iconColor)),
            PositionedDirectional(
              end: 0,
              child: Container(
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: counterBgColor ??
                        (dark ? QafColors.white : QafColors.black)),
                child: Center(
                    child: Text(
                  '${context.read<CartCubit>().noOfCartItems}',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: dark ? QafColors.black : QafColors.white,
                      fontSizeFactor: .8),
                )),
              ),
            ),
          ],
        );
      },
    );
  }
}
