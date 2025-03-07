import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_cubit.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/validation/validator.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: QafAppBar(
        showBackArrow: true,
        title: Text('Change Name'),
      ),
      body: BlocListener<UserCubit, UserState>(
        listenWhen: (previous, current) => current != previous,
        listener: (context, state) {
          state.maybeWhen(
            loadingUpdate: () {
              FullScreenLoader.openLoadingDialog(
                  'We are Proccessing your information....',
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
        child: Padding(
          padding: const EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Form(
            key: userCubit.nameFormKey,
            child: Column(
              spacing: QafSizes.spaceBtwSections,
              children: [
                Text(
                  'Use real name for easy verification. This name will appear on several pages',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextFormField(
                  controller: userCubit.firstNameController,
                  validator: (value) =>
                      Validator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user_edit),
                    labelText: QafStrings.firstName,
                  ),
                ),
                TextFormField(
                  controller: userCubit.lastNameController,
                  validator: (value) =>
                      Validator.validateEmptyText('Last Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user_edit),
                    labelText: QafStrings.lastName,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      userCubit.updateName();
                    },
                    child: Text(QafStrings.submit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
