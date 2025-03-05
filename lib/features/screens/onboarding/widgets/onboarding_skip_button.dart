import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/onboarding/controller/cubit/onboarding_cubit.dart';
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
        onPressed: () => context.read<OnboardingCubit>().skipPage(),
        child: Text(QafStrings.skip),
      ),
    );
  }
}
