import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/common/widgets/success_screen.dart';
import 'package:qaf_store/features/screens/verfiy_email/controller/cubit/verify_email_cubit.dart';
import 'package:qaf_store/features/screens/verfiy_email/controller/cubit/verify_email_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listenWhen: (previous, current) =>
          current is VerifyLoading ||
          current is VerifySuccess ||
          current is VerificationVerifiedSuccess ||
          current is VerifyError,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => FullScreenLoader.openLoadingDialog(
              'We are Proccessing your information....',
              Assets.images.animations.a141594AnimationOfDocer,
              context),
          success: () {
            Loaders.successSnackBar(
                context: context,
                title: 'Email Sent!',
                message: 'Please Check your emails and verify your account.');
          },
          verificationSuccess: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessScreen(
                title: QafStrings.yourAccountCreatedTitle,
                subTitle: QafStrings.yourAccountCreatedSubTitle,
                image: Assets.images.animations.a72462CheckRegister,
                onPressed: () => context.pushNamed(Routes.loginScreen),
              ),
            ),
          ),
          error: (error) {
            Loaders.errorSnackBar(
                context: context, title: 'Oh Snap!', message: error.toString());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
