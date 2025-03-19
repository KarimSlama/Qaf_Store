import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_cubit.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

class AddressBlocListener extends StatelessWidget {
  const AddressBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressesCubit, AddressesState>(
      bloc: getIt<AddressesCubit>(),
      listener: (context, state) {
        state.whenOrNull(
          addNewAddressLoading: () {
            FullScreenLoader.openLoadingDialog('Storing Address....',
                Assets.images.animations.a141594AnimationOfDocer, context);
            context.pop();
          },
          addNewAddressSuccess: (data) {
            context.read<AddressesCubit>().restFormField();
            Loaders.successSnackBar(
                context: context,
                title: QafStrings.congratulations,
                message: 'The Address has been added Correctly!');
            context.pop();
          },
          addNewAddressError: (error) {
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
