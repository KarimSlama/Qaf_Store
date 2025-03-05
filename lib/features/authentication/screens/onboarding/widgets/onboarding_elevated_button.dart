import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/authentication/screens/onboarding/controller/cubit/onboarding_cubit.dart';
import 'package:qaf_store/features/authentication/screens/onboarding/controller/cubit/onboarding_state.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/devices/qaf_device_utility.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class OnboardingElevatedButton extends StatelessWidget {
  const OnboardingElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => SizedBox.shrink(),
          nextPage: (nextPageIndex) => context.pushNamed(Routes.loginScreen),
        );
      },
      child: PositionedDirectional(
          end: QafSizes.defaultSpace,
          bottom: QafDeviceUtility.getBottomNavigationBarHeight(),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(side: BorderSide.none),
                  backgroundColor: dark ? QafColors.primary : QafColors.black),
              onPressed: () =>
                  context.read<OnboardingCubit>().nextPage(context),
              child: Icon(Iconsax.arrow_right_3))),
    );
  }
}
