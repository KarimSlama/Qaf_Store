import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/list_tiles/upload_menu_title.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/upload_data/controller/cubit/upload_cubit.dart';
import 'package:qaf_store/features/screens/upload_data/widget/upload_bloc_listener.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        showBackArrow: true,
        title: Text(QafStrings.uploadData),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwItems / 2,
            children: [
              SectionHeading(
                  text: QafStrings.mainRecord, isActionButton: false),
              UploadMenuTitle(
                icon: Iconsax.category,
                title: QafStrings.uploadCategories,
                trailing: IconButton(
                    onPressed: () =>
                        context.read<UploadCubit>().uploadCategories(),
                    icon: Icon(Iconsax.arrow_up_1, color: QafColors.primary)),
              ),
              UploadMenuTitle(
                icon: Iconsax.shop,
                title: QafStrings.uploadBrands,
                trailing: IconButton(
                    onPressed: () =>
                        context.read<UploadCubit>().uploadProducts(),
                    icon: Icon(Iconsax.arrow_up_1, color: QafColors.primary)),
              ),
              UploadMenuTitle(
                icon: Iconsax.shopping_cart,
                title: QafStrings.uploadProducts,
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_up_1, color: QafColors.primary)),
              ),
              UploadMenuTitle(
                icon: Iconsax.image,
                title: QafStrings.uploadBanners,
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_up_1, color: QafColors.primary)),
              ),
              SizedBox(height: QafSizes.spaceBtwItems),
              SectionHeading(
                  text: QafStrings.relationships, isActionButton: false),
              Text(QafStrings.makeSureYouHaveAlreadyUploadedAllTheContentAbove,
                  style: Theme.of(context).textTheme.labelLarge),
              UploadMenuTitle(
                icon: Iconsax.link,
                title: QafStrings.uploadBrandsAndCategoriesRelationData,
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_up_1, color: QafColors.primary)),
              ),
              UploadMenuTitle(
                icon: Iconsax.link,
                title: QafStrings.uploadProductsCategoriesRelationData,
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_up_1, color: QafColors.primary)),
              ),
              UploadBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
