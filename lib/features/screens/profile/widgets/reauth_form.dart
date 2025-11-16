import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_cubit.dart';
import 'package:qaf_store/features/screens/profile/widgets/re_auth_bloc_listener.dart';

import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

import 'package:qaf_store/utils/validation/validator.dart';

class ReAuthForm extends StatelessWidget {
  const ReAuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authFormKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: QafAppBar(
        showBackArrow: true,
        title: Text('Re Authenticate Email and Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Form(
            key: authFormKey,
            child: Column(
              spacing: QafSizes.spaceBtwSections,
              children: [
                Text(
                  'Re Authenticated with your email and password that already in!',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) => Validator.validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct),
                    labelText: QafStrings.email,
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) => Validator.validatePassword(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: QafStrings.password,
                  ),
                ),
                //  TextFormField(
                //   controller: userCubit.passwordController,
                //   obscureText: isPassword,
                //   validator: (value) => Validator.validatePassword(value),
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(Iconsax.password_check),
                //     suffixIcon: IconButton(
                //       onPressed: () => userCubit.d(),
                //       icon: loginCubit.isPassword
                //           ? Icon(
                //               Iconsax.eye_slash,
                //             )
                //           : Icon(
                //               Iconsax.eye3,
                //             ),
                //     ),
                //     labelText: QafStrings.password,
                //   ),
                // ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (authFormKey.currentState!.validate()) {
                        userCubit.reAuthenticateAndDelete(
                            emailController.text.trim(),
                            passwordController.text.trim());
                      }
                    },
                    child: Text(QafStrings.submit),
                  ),
                ),
                ReAuthBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
