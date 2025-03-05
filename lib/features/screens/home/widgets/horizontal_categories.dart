import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/features/screens/home/widgets/vertical_popular_category_image_text.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class HorizontalHomeCategories extends StatelessWidget {
  const HorizontalHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => VerticalPopularCategoryImageText(
            onTap: () => context.pushNamed(Routes.subCategoryScreen),
            image: Assets.icons.categories.icons8Bowling64.path,
            title: QafStrings.popularCategories),
      ),
    );
  }
}
