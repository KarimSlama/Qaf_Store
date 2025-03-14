import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/cards/brand_card.dart';
import 'package:qaf_store/common/widgets/products/sort/sortable_products.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/common/widgets/shimmer/product_shimmer_effect.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/cloud_helper_function.dart';

class BrandProductsScreen extends StatelessWidget {
  final BrandModel brands;
  const BrandProductsScreen({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title:
            Text(brands.name, style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwSections,
            children: [
              BrandCard(
                showBorder: true,
                brands: brands,
              ),
              FutureBuilder(
                future: context
                    .read<ProductCubit>()
                    .getProductsByBrand(brandId: brands.id),
                builder: (context, snapshot) {
                  final loader = ProductShimmerEffect();
                  final widget = CloudHelperFunction.checkMultiRecordState(
                      snapshot: snapshot, loading: loader);
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.read<ProductCubit>().assignProducts(products);
                  });
                  return SortableProducts();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
