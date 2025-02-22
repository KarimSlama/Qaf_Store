import 'package:flutter/material.dart';
import 'package:qaf_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/devices/qaf_device_utility.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: QafDeviceUtility.getAppbarHeight(),
      end: QafSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: Text(QafStrings.skip),
      ),
    );
  }
}
