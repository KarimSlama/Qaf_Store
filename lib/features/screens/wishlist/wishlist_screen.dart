import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/products/product_cards/vertical_product_card.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.wishlist,
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
              onPressed: () => context.pushNamed(Routes.homeScreen),
              icon: Icon(Iconsax.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            children: [
              GridViewLayout(
                itemCount: 8,
                itemBuilder: (_, index) => VerticalProductCard(index: index),
              )
            ],
          ),
        ),
      ),
    );
  }
}
