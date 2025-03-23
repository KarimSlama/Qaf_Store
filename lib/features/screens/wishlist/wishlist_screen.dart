import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/loaders/animation_loader.dart';
import 'package:qaf_store/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:qaf_store/common/widgets/shimmer/product_shimmer_effect.dart';
import 'package:qaf_store/features/screens/wishlist/controller/cubit/favorite_cubit.dart';
import 'package:qaf_store/features/screens/wishlist/controller/cubit/favorite_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavoriteCubit>(),
      child: Scaffold(
        appBar: QafAppBar(
          title: Text(QafStrings.wishlist,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            IconButton(
                onPressed: () => context.pushNamed(Routes.navigationMenu),
                icon: Icon(Iconsax.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
            child: Column(
              children: [
                BlocBuilder<FavoriteCubit, FavoriteState>(
                  buildWhen: (previous, current) =>
                      current is FavoriteLoading ||
                      current is FavoriteSuccess ||
                      current is FavoriteError,
                  builder: (context, state) {
                    return state.maybeWhen(
                      favoriteLoading: () => ProductShimmerEffect(),
                      favoriteSuccess: (favoriteProduct) {
                        return GridViewLayout(
                          itemCount: favoriteProduct.length,
                          itemBuilder: (_, index) => VerticalProductCard(
                            index: index,
                            products: favoriteProduct,
                          ),
                        );
                      },
                      favoriteError: (error) => Text(error),
                      orElse: () => AnimationLoaderWidget(
                        text:
                            'Wishlist is Empty try to add favorite Products first!',
                        animation:
                            Assets.images.animations.a140429PencilDrawing,
                        actionText: 'Let\'s add new products',
                        showAction: true,
                        onActionPressed: () =>
                            context.pushNamed(Routes.navigationMenu),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
