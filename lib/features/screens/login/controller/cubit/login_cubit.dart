import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_state.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_repository.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_social_repository.dart';

import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/constants/shared_preference_keys.dart';
import '../../data/model/login_request_model.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  final LoginSocialRepository loginSocialRepository;

  LoginCubit(this.loginRepository, this.loginSocialRepository)
      : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKay = GlobalKey<FormState>();
  bool isPassword = true;
  bool rememberMe = false;

  Future<void> login(context) async {
    emit(LoginState.loading());
    final respone = await loginRepository.login(
      LoginRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    respone.when(success: (uId) {
      if (rememberMe == true) {
        Constants.saveUserUid(uId!);
        isLoggedUser = true;
      }
      emit(LoginState.success(uId));
    }, failure: (error) {
      print('error is $error');
      emit(LoginState.error(error: error));
    });
  }

  Future<void> signInWithGoogle(context) async {
    emit(LoginState.loading());
    final respone = await loginSocialRepository.loginWithGoogle();
    respone.when(
      success: (userCredential) async {
        Constants.saveUserUid(userCredential.user!.uid);
        emit(LoginState.success(userCredential));
      },
      failure: (error) {
        print('the error is $error');
        emit(LoginState.error(error: error));
      },
    );
  }

  changePasswordIcon() {
    isPassword = !isPassword;
    emit(LoginState.passwordChanged(isPassword: isPassword));
  }

  rememberMeIcon(bool isChanged) {
    rememberMe = isChanged;
    emit(LoginState.rememberMeChanged(isCheck: rememberMe));
  }
}
