import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qaf_store/features/store/screens/home/widgets/vertical_popular_category_image_text.dart';
import 'package:qaf_store/features/store/screens/sub_category/sub_category_screen.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

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
            onTap: () => Get.to(() => SubCategoryScreen()),
            image: Assets.icons.categories.icons8Bowling64.path,
            title: QafStrings.popularCategories),
      ),
    );
  }
}
