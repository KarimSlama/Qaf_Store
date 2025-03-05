import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/screens/forgot_password/controller/cubit/reset_password_cubit.dart';
import 'package:qaf_store/features/screens/forgot_password/widgets/reset_password_bloc_listener.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/constants/spacing.dart';
import 'package:qaf_store/utils/validation/validator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resetCubit = context.read<ResetPasswordCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Form(
            key: resetCubit.resetFormKey,
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(QafStrings.forgotPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(QafStrings.forgotPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium),
                TextFormField(
                  controller: resetCubit.emailController,
                  validator: (value) => Validator.validateEmail(value),
                  decoration: InputDecoration(
                      labelText: QafStrings.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
                verticalSpace(20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (!resetCubit.resetFormKey.currentState!.validate()) {
                          return;
                        } else {
                          resetCubit.resetPasswordEmail(context);
                        }
                      },
                      child: Text(QafStrings.submit)),
                ),
                ResetPasswordBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
