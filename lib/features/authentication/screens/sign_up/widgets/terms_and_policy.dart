import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Row(
      spacing: 12.w,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            value: context.read<SignUpCubit>().privacyPolicy,
            onChanged: (value) {
              if (value != null)
                context.read<SignUpCubit>().changeCheckboxIcon(value);
            },
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${QafStrings.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Privacy and Policy');
                  },
                text: '${QafStrings.privacyAndPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? QafColors.white : QafColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? QafColors.white : QafColors.primary,
                    ),
              ),
              TextSpan(
                  text: '${QafStrings.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${QafStrings.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? QafColors.white : QafColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? QafColors.white : QafColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
