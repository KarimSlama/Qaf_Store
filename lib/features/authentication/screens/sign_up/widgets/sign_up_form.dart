import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/widgets/terms_and_policy.dart';
import 'package:qaf_store/features/authentication/screens/verfiy_email/verfiy_email_screen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/constants/spacing.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 14.h,
        children: [
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: QafStrings.firstName,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: QafStrings.lastName,
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: QafStrings.userName,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: QafStrings.email,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: QafStrings.phone,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: QafStrings.password,
            ),
          ),
          TermsAndPolicy(),
          verticalSpace(16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => VerifyEmailScreen()),
                child: Text(QafStrings.createAccount)),
          ),
        ],
      ),
    );
  }
}
