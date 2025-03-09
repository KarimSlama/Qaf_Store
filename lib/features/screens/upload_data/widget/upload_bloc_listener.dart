import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/upload_data/controller/cubit/upload_cubit.dart';
import 'package:qaf_store/features/screens/upload_data/controller/cubit/upload_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

class UploadBlocListener extends StatelessWidget {
  const UploadBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadCubit, UploadState>(
      listener: (context, state) {
        state.whenOrNull(
          categoryLoading: () => FullScreenLoader.openLoadingDialog(
              'We are Proccessing your Category Uploading....',
              Assets.images.animations.a141594AnimationOfDocer,
              context),
          categorySuccess: () {
            context.pop();
            print('successed uploading');
            // context.pushNamed(Routes.navigationMenu);
          },
          categoryError: (error) {
            Loaders.errorSnackBar(
                context: context,
                title: QafStrings.ohSnap,
                message: error.toString());
          },
          productLoading: () => FullScreenLoader.openLoadingDialog(
              'We are Proccessing your Category Uploading....',
              Assets.images.animations.a141594AnimationOfDocer,
              context),
          productSuccess: () {
            context.pop();
            print('successed uploading');
            // context.pushNamed(Routes.navigationMenu);
          },
          productryError: (error) {
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
