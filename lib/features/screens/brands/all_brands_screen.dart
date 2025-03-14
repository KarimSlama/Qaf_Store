import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/cards/brand_card.dart';
import 'package:qaf_store/common/widgets/layout/grid_view_layout.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class AllBrandsScreen extends StatelessWidget {
  final List<BrandModel> brands;
  const AllBrandsScreen({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.brands,
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwSections,
            children: [
              SectionHeading(text: QafStrings.brands, isActionButton: false),
              GridViewLayout(
                mainAxisExtent: 70,
                itemCount: brands.length,
                itemBuilder: (_, index) {
                  return BrandCard(
                    showBorder: true,
                    onTap: () => context.pushNamed(Routes.brandProductsScreen, arguments: brands[index]),
                    brands: brands[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
