import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/loaders/animation_loader.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/features/screens/cart/widgets/cart_items.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emptyWidget = AnimationLoaderWidget(
      text: 'Whoops! Cart is Empty',
      animation: Assets.images.animations.ladyAddingProductInCartAnimation,
      showAction: true,
      actionText: 'Let\'s fill the Cart!',
      onActionPressed: () => context.pushNamed(Routes.navigationMenu),
    );
    return Scaffold(
        appBar: QafAppBar(
          title: Text(QafStrings.cart,
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true,
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return state.cartItems.isEmpty
                ? emptyWidget
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
                      child: CartItems(),
                    ),
                  );
          },
        ),
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return  state.cartItems.isNotEmpty
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: QafSizes.defaultSpace,
                        end: QafSizes.defaultSpace,
                        bottom: QafSizes.defaultSpace),
                    child: ElevatedButton(
                      onPressed: () => context.pushNamed(Routes.checkoutScreen),
                      child: Text(
                          '${QafStrings.checkout}  \$${state.totalCartPrice}'),
                    ),
                  )
                : SizedBox();
          },
        ));
  }
}
