import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/products/sort/sortable_products.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/common/widgets/shimmer/product_shimmer_effect.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/cloud_helper_function.dart';

class AllProductsScreen extends StatelessWidget {
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

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
          child: FutureBuilder(
              future: futureMethod ??
                  context.read<ProductCubit>().fetchProductByQuery(query),
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
              }),
        ),
      ),
    );
  }
}
