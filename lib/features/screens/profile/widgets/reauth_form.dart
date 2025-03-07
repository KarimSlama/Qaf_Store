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
import 'package:qaf_store/utils/constants/shared_preference_keys.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/local_storage/shared_preferences.dart';
import 'package:qaf_store/utils/routings/routes.dart';
import 'package:qaf_store/utils/validation/validator.dart';

class ReAuthForm extends StatelessWidget {
  const ReAuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: QafAppBar(
        showBackArrow: true,
        title: Text('Re Authenticate Email and Password'),
      ),
      body: BlocListener<UserCubit, UserState>(
        listenWhen: (previous, current) => current != previous,
        listener: (context, state) {
          state.maybeWhen(
            reAuthLoading: () {
              FullScreenLoader.openLoadingDialog(
                  'We are Proccessing your information....',
                  Assets.images.animations.a141594AnimationOfDocer,
                  context);
              context.pop();
            },
            reAuthSuccess: () {
              Loaders.successSnackBar(
                  context: context,
                  title: QafStrings.congratulations,
                  message: 'Your name is successfully updated');
                  SharedPreference.removeData(SharedPreferenceKey.userUidKey);
              context.pushNamed(Routes.loginScreen);
            },
            error: (error) => Text(error),
            orElse: () => Text('no data found'),
          );
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Form(
            key: userCubit.authFormKey,
            child: Column(
              spacing: QafSizes.spaceBtwSections,
              children: [
                Text(
                  'Re Authenticated with your email and password that already in!',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextFormField(
                  controller: userCubit.emailController,
                  validator: (value) => Validator.validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct),
                    labelText: QafStrings.email,
                  ),
                ),
                TextFormField(
                  controller: userCubit.passwordController,
                  validator: (value) => Validator.validatePassword(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: QafStrings.password,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      userCubit.reAuthenticateEmailAndPassword();
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
