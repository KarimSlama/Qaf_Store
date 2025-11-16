import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.w,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: QafColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => Loaders.warningSnackBar(
                context: context,
                title: 'Oh snap!',
                message:
                    'This feature still under development, kindly skip this and try register with Email and Password instead!📌'),
            icon: Image.asset(
                width: QafSizes.iconLg,
                height: QafSizes.iconLg,
                Assets.images.content.facebookIcon.path),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: QafColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => Loaders.warningSnackBar(
                context: context,
                title: 'Oh snap!',
                message:
                    'This feature still under development, kindly skip this and try register with Email and Password instead!📌'),

            // onPressed: () =>
            //     context.read<LoginCubit>().signInWithGoogle(context),
            icon: Image.asset(
                width: QafSizes.iconLg,
                height: QafSizes.iconLg,
                Assets.images.content.googleIcon.path),
          ),
        ),
      ],
    );
  }
}
