import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class SortableProducts extends StatelessWidget {
  final String? id;
  const SortableProducts({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<ProductCubit>();

    context.read<ProductCubit>().getProductsByBrand(brandId: id ?? '1');

    return Column(
      spacing: QafSizes.spaceBtwSections,
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            homeCubit.sortProducts(value!);
          },
          value: homeCubit.selectedOption,
        ),
        BlocBuilder<ProductCubit, ProductState>(
          buildWhen: (previous, current) =>
              current is ProductsSuccess ||
              current is ProductsLoading ||
              current is ProductsError,
          builder: (context, state) {
            return state.maybeWhen(
              productsLoading: () => QafShimmerEffect(width: 180, height: 180),
              productsSuccess: (products) {
                return GridViewLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => VerticalProductCard(
                    index: index,
                                  products: products,
                  ),
                );
              },
              productsError: (error) => Center(child: Text(error)),
              orElse: () => Text('Empty'),
            );
          },
        ),
      ],
    );
  }
}
