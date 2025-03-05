import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/forgot_password/controller/cubit/reset_password_cubit.dart';
import 'package:qaf_store/features/screens/forgot_password/controller/cubit/reset_password_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => FullScreenLoader.openLoadingDialog(
              'We are Proccessing your information....',
              Assets.images.animations.a141594AnimationOfDocer,
              context),
          success: (email) {
            context.pop();
            context.pushNamed(Routes.resetPasswordScreen, arguments: email);
          },
          error: (error) {
            Loaders.errorSnackBar(
                context: context,
                title: QafStrings.ohSnap,
                message: error.toString());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
