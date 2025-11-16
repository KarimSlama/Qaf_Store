import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/features/screens/verfiy_email/controller/cubit/verify_email_cubit.dart';
import 'package:qaf_store/features/screens/verfiy_email/widgets/verify_email_bloc_listener.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String? email;
  const VerifyEmailScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => context.pushNamed(Routes.loginScreen),
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
                email ?? '',
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
                    onPressed: () => context
                        .read<VerifyEmailCubit>()
                        .checkEmailVerificationStatus(),
                    child: Text(QafStrings.continue_)),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => context
                        .read<VerifyEmailCubit>()
                        .sendVerifyEmail(),
                    child: Text(QafStrings.resendEmail)),
              ),
              VerifyEmailBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
