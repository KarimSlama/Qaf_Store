import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/devices/qaf_device_utility.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class OnboardingElevatedButton extends StatelessWidget {
  const OnboardingElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return PositionedDirectional(
        end: QafSizes.defaultSpace,
        bottom: QafDeviceUtility.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(side: BorderSide.none),
                backgroundColor: dark ? QafColors.primary : QafColors.black),
            onPressed: () => OnboardingController.instance.nextPage(),
            child: Icon(Iconsax.arrow_right_3)));
  }
}
