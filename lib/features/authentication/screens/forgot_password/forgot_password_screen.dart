import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/authentication/screens/reset_password/reset_password_screen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/constants/spacing.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: 16.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(QafStrings.forgotPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(QafStrings.forgotPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium),
              TextFormField(
                decoration: InputDecoration(
                    labelText: QafStrings.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
              verticalSpace(20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => ResetPasswordScreen()),
                    child: Text(QafStrings.submit)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
