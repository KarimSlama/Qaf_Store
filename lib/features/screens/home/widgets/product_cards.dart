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
      buildWhen: (previous, current) {
        if (previous is! ProductDataState || current is! ProductDataState) {
          return true;
        }
        return previous.products != current.products ||
            previous.isProductsLoading != current.isProductsLoading ||
            previous.productsError != current.productsError;
      },
      builder: (context, state) {
        if (state is! ProductDataState) return const SizedBox.shrink();

        if (state.isProductsLoading) {
          return const QafShimmerEffect(width: 180, height: 180);
        }

        if (state.productsError != null) {
          return Text(state.productsError!);
        }

        if (state.products == null || state.products!.isEmpty) {
          return const SizedBox.shrink();
        }

        return GridViewLayout(
          itemCount: 4,
          itemBuilder: (_, index) => VerticalProductCard(
            index: index,
            products: state.products!,
          ),
        );
      },
    );
  }
}