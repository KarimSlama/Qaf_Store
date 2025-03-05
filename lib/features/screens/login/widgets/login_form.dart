import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_cubit.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_state.dart';
import 'package:qaf_store/features/screens/login/widgets/login_bloc_listener.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';
import 'package:qaf_store/utils/validation/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: loginCubit.loginFormKay,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: QafSizes.spaceBtwSections),
            child: Column(
              spacing: 14.h,
              children: [
                TextFormField(
                  controller: loginCubit.emailController,
                  validator: (value) => Validator.validateEmail(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: QafStrings.email,
                  ),
                ),
                TextFormField(
                  controller: loginCubit.passwordController,
                  obscureText: loginCubit.isPassword,
                  validator: (value) => Validator.validatePassword(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => loginCubit.changePasswordIcon(),
                      icon: loginCubit.isPassword
                          ? Icon(
                              Iconsax.eye_slash,
                            )
                          : Icon(
                              Iconsax.eye3,
                            ),
                    ),
                    labelText: QafStrings.password,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: loginCubit.rememberMe,
                          onChanged: (value) {
                            if (value != null) loginCubit.rememberMeIcon(value);
                          },
                        ),
                        const Text(QafStrings.rememberMe),
                      ],
                    ),
                    TextButton(
                      onPressed: () =>
                          context.pushNamed(Routes.forgotPasswordScreen),
                      child: Text(QafStrings.forgotPassword),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (!loginCubit.loginFormKay.currentState!.validate()) {
                          return;
                        } else {
                          loginCubit.login(context);
                        }
                      },
                      child: Text(QafStrings.signIn)),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => context.pushNamed(Routes.signupScreen),
                      child: Text(QafStrings.createAccount)),
                ),
                LoginBlocListener(),
              ],
            ),
          ),
        );
      },
    );
  }
}
