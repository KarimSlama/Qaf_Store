import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qaf_store/common/widgets/success_screen.dart';
import 'package:qaf_store/features/authentication/screens/login/login_screen.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(QafSizes.defaultSpace),
          child: Column(
            spacing: 18.h,
            children: [
              Image.asset(
                  width: QafHelperFunctions.screenWidth(context) * .6,
                  Assets.images.animations.sammyLineSale.path),
              Text(
                QafStrings.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                'support@example.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                QafStrings.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                      () => SuccessScreen(
                          image: Assets.images.animations.sammyLineSale.path,
                          title: QafStrings.yourAccountCreatedTitle,
                          subTitle: QafStrings.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => LoginScreen()),
                        )),
                    child: Text(QafStrings.continue_)),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: Text(QafStrings.resendEmail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
