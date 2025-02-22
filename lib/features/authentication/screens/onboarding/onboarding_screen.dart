import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaf_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:qaf_store/features/authentication/data/models/on_boarding/boarding_list.dart';
import 'package:qaf_store/features/authentication/screens/onboarding/widgets/onboarding_elevated_button.dart';
import 'package:qaf_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:qaf_store/features/authentication/screens/onboarding/widgets/onboarding_skip_button.dart';
import 'package:qaf_store/features/authentication/screens/onboarding/widgets/onboarding_smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: List<Widget>.generate(
              boarding.length,
              (index) => OnboardingPage(
                image: boarding[index].image,
                title: boarding[index].title,
                subTitle: boarding[index].subTitle,
              ),
            ),
          ),
          OnboardingSkipButton(),
          OnboardingSmoothPageIndicator(),
          OnboardingElevatedButton(),
        ],
      ),
    );
  }
}
