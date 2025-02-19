import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/qaf_divider_widget.dart';
import 'package:qaf_store/common/widgets/social_buttons.dart';
import 'package:qaf_store/features/login/screen/widgets/login_header_widget.dart';
import 'package:qaf_store/features/login/screen/widgets/login_form.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: QafSizes.appBarHeight,
            bottom: QafSizes.defaultSpace,
            start: QafSizes.defaultSpace,
            end: QafSizes.defaultSpace,
          ),
          child: Column(
            spacing: 16.h,
            children: [
              LoginHeaderWidget(),
              LoginForm(),
              QafDividerWidget(dividerText: QafStrings.orSignInWith),
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
