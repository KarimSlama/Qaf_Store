import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/features/onboarding/controller/onboarding_controller.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/devices/qaf_device_utility.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSmoothPageIndicator extends StatelessWidget {
  const OnboardingSmoothPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = QafHelperFunctions.isDark(context);

    return PositionedDirectional(
      bottom: QafDeviceUtility.getBottomNavigationBarHeight(),
      start: QafSizes.defaultSpace,
      child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? QafColors.light : QafColors.dark,
              dotHeight: 6.h),
          count: 3),
    );
  }
}
