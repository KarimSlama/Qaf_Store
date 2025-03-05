import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/controller/cubit/sign_up_state.dart';
import 'package:qaf_store/features/authentication/screens/sign_up/widgets/terms_and_policy.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/constants/spacing.dart';
import 'package:qaf_store/utils/validation/validator.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Form(
          key: signUpCubit.signUpFormKey,
          child: Column(
            spacing: 14.h,
            children: [
              Row(
                spacing: 10.w,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: signUpCubit.firstNameController,
                      expands: false,
                      validator: (value) =>
                          Validator.validateEmptyText('First Name', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: QafStrings.firstName,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: signUpCubit.lastNameController,
                      expands: false,
                      validator: (value) =>
                          Validator.validateEmptyText('Last Name', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: QafStrings.lastName,
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: signUpCubit.userNameController,
                validator: (value) =>
                    Validator.validateEmptyText('User Name', value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: QafStrings.userName,
                ),
              ),
              TextFormField(
                controller: signUpCubit.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validator.validateEmail(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct),
                  labelText: QafStrings.email,
                ),
              ),
              TextFormField(
                controller: signUpCubit.phoneController,
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => Validator.validatePhone(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  labelText: QafStrings.phone,
                ),
              ),
              TextFormField(
                controller: signUpCubit.passwordController,
                validator: (value) => Validator.validatePassword(value),
                obscureText: signUpCubit.isPassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => signUpCubit.changePasswordIcon(),
                    icon: signUpCubit.isPassword
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
              TermsAndPolicy(),
              verticalSpace(16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (!signUpCubit.signUpFormKey.currentState!.validate()) {
                      return;
                    } else {
                      signUpCubit.signup(context);
                    }
                  },
                  child: Text(QafStrings.createAccount),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
