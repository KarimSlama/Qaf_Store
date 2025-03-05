import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/qaf_divider_widget.dart';
import 'package:qaf_store/common/widgets/social_buttons.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/widgets/sign_up_bloc_listener.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/widgets/sign_up_form.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/constants/spacing.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(QafSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 18.h,
            children: [
              Text(QafStrings.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SignUpForm(),
              verticalSpace(16),
              QafDividerWidget(dividerText: QafStrings.orSignUpWith),
              SocialButtons(),
              RegisterBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
