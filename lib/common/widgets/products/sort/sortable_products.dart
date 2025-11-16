import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:qaf_store/common/widgets/shimmer/product_shimmer_effect.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class SortableProducts extends StatelessWidget {
  final String? id;
  final List? products;
  const SortableProducts({super.key, this.id, this.products});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<ProductCubit>();

    if (id != null) {
      cubit.fetchAllProducts(brandId: id);
    }

    return Column(
      spacing: QafSizes.spaceBtwSections,
      children: [
        BlocBuilder<ProductCubit, ProductState>(
          bloc: cubit,
          buildWhen: (previous, current) {
            if (previous is! ProductDataState || current is! ProductDataState) {
              return true;
            }
            return previous.products != current.products;
          },
          builder: (context, state) {
            if (state is! ProductDataState) {
              return const SizedBox.shrink();
            }

            return DropdownButtonFormField<String>(
              decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              items: [
                'Name',
                'Higher Price',
                'Lower Price',
                'Sale',
                'Newest',
              ]
                  .map((option) =>
                      DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  cubit.selectedOption = value;
                  cubit.sortProducts(value);
                }
              },
              initialValue: cubit.selectedOption,
            );
          },
        ),
        BlocBuilder<ProductCubit, ProductState>(
          bloc: cubit,
          buildWhen: (previous, current) {
            if (previous is! ProductDataState || current is! ProductDataState) {
              return true;
            }
            return previous.products != current.products ||
                previous.isProductsLoading != current.isProductsLoading ||
                previous.productsError != current.productsError;
          },
          builder: (context, state) {
            if (state is! ProductDataState) {
              return const SizedBox.shrink();
            }

            // Loading
            if (state.isProductsLoading) {
              return const ProductShimmerEffect();
            }

            // Error
            if (state.productsError != null) {
              return Center(child: Text(state.productsError!));
            }

            // Success
            if (state.products == null || state.products!.isEmpty) {
              return Center(child: Text('No Items Found'));
            }

            return GridViewLayout(
              itemCount: state.products!.length,
              itemBuilder: (_, index) => VerticalProductCard(
                index: index,
                products: state.products!,
              ),
            );
          },
        ),
      ],
    );
  }
}
