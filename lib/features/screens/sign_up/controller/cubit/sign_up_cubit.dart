import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/sign_up/controller/cubit/sign_up_state.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/features/screens/sign_up/data/repo/register_repository.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/constants/shared_preference_keys.dart';

import '../../../../../utils/constants/constants.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final RegisterRepository signupRepo;
  SignUpCubit(this.signupRepo) : super(SignUpState.initial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool privacyPolicy = false;

  void signup(context) async {
    emit(SignUpState.loading());
    await Future.delayed(const Duration(seconds: 2));
    if (!privacyPolicy) {
      Loaders.warningSnackBar(
        context: context,
        title: QafStrings.acceptPrivacyPolicy,
        message: QafStrings
            .inOrderToCreateAccountYouHaveToReadAndAcceptThePrivacyTermsOfUse,
      );
      return;
    }

    final userModel = UserModel(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phone: phoneController.text.trim(),
      profilePicture: '',
      password: passwordController.text.trim(),
      userName: userNameController.text.trim(),
      email: emailController.text.trim(),
    );

    final result = await signupRepo.signUp(userModel);

    result.when(
      success: (uId) {
        isLoggedUser = true;
        Constants.saveUserUid(uId!);
        emit(SignUpState.success(emailController.text.trim()));
      },
      failure: (error) {
        emit(SignUpState.error(error: error));
      },
    );
  }

  changePasswordIcon() {
    isPassword = !isPassword;
    emit(SignUpState.passwordChanged(isPassword: isPassword));
  }

  changeCheckboxIcon(bool isChanged) {
    privacyPolicy = isChanged;
    emit(SignUpState.checkboxChanged(isCheck: privacyPolicy));
  }
}
