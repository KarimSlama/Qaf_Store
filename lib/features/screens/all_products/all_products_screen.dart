import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/products/sort/sortable_products.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_state.dart';
import 'package:qaf_store/common/widgets/shimmer/product_shimmer_effect.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class AllProductsScreen extends StatelessWidget {
  final String title;
  final Query? query;
  const AllProductsScreen({super.key, required this.title, this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: BlocBuilder<ProductCubit, ProductState>(
            bloc: getIt<ProductCubit>()..fetchProductByQuery(query),
            builder: (context, state) {
              if (state is ProductsLoading) {
                
                return ProductShimmerEffect();
              } else if (state is ProductsSuccess) {
                final products = state.products;
                return SortableProducts(products: products);
              } else if (state is ProductsError) {
                return Center(child: Text('error all products screen'));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}