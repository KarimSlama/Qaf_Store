import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

import '../../../../common/widgets/popups/full_screen_loader.dart';
import '../../../../common/widgets/popups/loaders.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/constants/qaf_strings.dart';
import '../../../../utils/constants/shared_preference_keys.dart';
import '../../../../utils/local_storage/shared_preferences.dart';
import '../../../../utils/routings/routes.dart';
import '../controller/cubit/user_cubit.dart';
import '../controller/cubit/user_state.dart';

class ReAuthBlocListener extends StatelessWidget {
  const ReAuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (previous, current) => current != previous,
      listener: (context, state) {
        state.maybeWhen(
          reAuthLoading: () {
            FullScreenLoader.openLoadingDialog(
                QafStrings.weAreProccessingYourInformation,
                Assets.images.animations.a141594AnimationOfDocer,
                context);
            context.pop();
          },
          reAuthSuccess: () {
            Loaders.successSnackBar(
                context: context,
                title: QafStrings.congratulations,
                message: 'You have successfuly logged out');
            SharedPreference.removeData(SharedPreferenceKey.userUidKey);
            context.pushNamed(Routes.loginScreen);
          },
          error: (error) => Text(error),
          orElse: () => Text('no data found'),
        );
      },
      child: SizedBox(),
    );
  }
}
