import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_cubit.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            FullScreenLoader.openLoadingDialog(
                'We are Proccessing your information....',
                Assets.images.animations.a141594AnimationOfDocer,
                context);
          },
          success: (data) {
            FullScreenLoader.stopLoading(context);
            Loaders.successSnackBar(
                context: context,
                title: QafStrings.congratulations,
                message:
                    QafStrings.youAreLoggedInPerfectlyNowShopWhteverYouWant);
             
            context.pushNamed(Routes.navigationMenu);
          },
          error: (error) {
            FullScreenLoader.stopLoading(context);
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
