import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/cards/brand_card.dart';
import 'package:qaf_store/common/widgets/products/sort/sortable_products.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

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
              SectionHeading(text: QafStrings.products, isActionButton: false),
              SortableProducts(id: brands.id),
            ],
          ),
        ),
      ),
    );
  }
}
