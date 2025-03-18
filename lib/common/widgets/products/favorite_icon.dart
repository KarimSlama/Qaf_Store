import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/icons/circular_icon.dart';
import 'package:qaf_store/features/screens/wishlist/controller/cubit/favorite_cubit.dart';
import 'package:qaf_store/features/screens/wishlist/controller/cubit/favorite_state.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class FavoriteIcon extends StatelessWidget {
  final String productId;
  const FavoriteIcon({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productCubit  = context.read<FavoriteCubit>();
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return CircularIcon(
            icon: productCubit.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
            color: productCubit.isFavorite(productId) ? QafColors.error : null,
            onPressed: ()=> productCubit.toggleFavoriteProduct(productId, context),
          );
      },
    );
  }
}
