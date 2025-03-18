import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';

class ProductCards extends StatelessWidget {
  const ProductCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return state.maybeWhen(
          productsLoading: () => QafShimmerEffect(width: 180, height: 180),
          productsSuccess: (products) {
            return GridViewLayout(
              itemCount: 4,
              itemBuilder: (_, index) => VerticalProductCard(
                index: index,
                products: products,
              ),
            );
          },
          productsError: (error) => Text(error),
          orElse: () => Text(''),
        );
      },
    );
  }
}
