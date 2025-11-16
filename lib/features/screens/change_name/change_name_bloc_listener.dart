import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

import '../../../common/widgets/popups/full_screen_loader.dart';
import '../../../common/widgets/popups/loaders.dart';
import '../../../gen/assets.gen.dart';
import '../profile/controller/cubit/user_cubit.dart';
import '../profile/controller/cubit/user_state.dart';

class ChangeNameBlocListener extends StatelessWidget {
  const ChangeNameBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (previous, current) => current != previous,
      listener: (context, state) {
        state.maybeWhen(
          loadingUpdate: () {
            FullScreenLoader.openLoadingDialog(
                QafStrings.weAreProccessingYourInformation,
                Assets.images.animations.a141594AnimationOfDocer,
                context);
            context.pop();
          },
          updateSuccess: () {
            Loaders.successSnackBar(
                context: context,
                title: QafStrings.congratulations,
                message: 'Your name is successfully updated');
            context.read<UserCubit>().fetchUserDetails();
          },
          error: (error) => Text(error),
          orElse: () => Text('no data found'),
        );
      },
    );
  }
}
