import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/controller/cubit/sign_up_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => FullScreenLoader.openLoadingDialog(
              'We are Proccessing your information....',
              Assets.images.animations.a141594AnimationOfDocer,
              context),
          success: (data) {
            print('the data come with success in sign up bloc listener ${data}');
            context.pop();
            context.pushNamed(Routes.verifyScreen, arguments: data);
          },
          error: (error) {
            Loaders.errorSnackBar(context: context, title: error.toString());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
