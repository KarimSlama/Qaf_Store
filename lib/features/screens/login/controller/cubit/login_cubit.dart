import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_state.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_repository.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_social_repository.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/constants/shared_preference_keys.dart';
import 'package:qaf_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:qaf_store/utils/exceptions/format_exceptions.dart';
import 'package:qaf_store/utils/exceptions/platform_exceptions.dart';
import 'package:qaf_store/utils/local_storage/shared_preferences.dart';

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
    try {
      emit(LoginState.loading());
      await Future.delayed(const Duration(seconds: 2));
      final respone = await loginRepository.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      respone.when(
        success: (uId) {
          Loaders.successSnackBar(
              context: context,
              title: QafStrings.congratulations,
              message: QafStrings.youAreLoggedInPerfectlyNowShopWhteverYouWant);
          if (rememberMe == true) {
            saveUserUid(uId!);
          }
          emit(LoginState.success(uId));
        },
        failure: (error) => emit(LoginState.error(error: error)),
      );
    } on FirebaseAuthException catch (error) {
      final errorMessage = QafFirebaseAuthException(error.code).message;
      emit(LoginState.error(error: errorMessage));
      Loaders.errorSnackBar(
          context: context, title: QafStrings.error, message: errorMessage);
    } on FirebaseException catch (error) {
      final errorMessage = QafFirebaseAuthException(error.code).message;
      emit(LoginState.error(error: errorMessage));
      Loaders.errorSnackBar(
          context: context, title: QafStrings.error, message: errorMessage);
    } on FormatException catch (_) {
      final errorMessage = QafFormatException().message;
      emit(LoginState.error(error: errorMessage));
      Loaders.errorSnackBar(
          context: context, title: QafStrings.error, message: errorMessage);
    } on PlatformException catch (error) {
      final errorMessage = QafPlatformException(error.code).message;
      emit(LoginState.error(error: errorMessage));
      Loaders.errorSnackBar(
          context: context, title: QafStrings.error, message: errorMessage);
    } catch (error) {
      emit(LoginState.error(error: error.toString()));
      Loaders.errorSnackBar(
          context: context, title: QafStrings.error, message: error.toString());
    }
  }

  Future<void> signInWithGoogle(context) async {
    emit(LoginState.loading());
    await Future.delayed(const Duration(seconds: 2));
    final respone = await loginSocialRepository.loginWithSocial();
    respone.when(
      success: (userCredential) async {
        Loaders.successSnackBar(
            context: context,
            title: QafStrings.congratulations,
            message: QafStrings.youAreLoggedInPerfectlyNowShopWhteverYouWant);
        saveUserUid(userCredential.user!.uid);
        emit(LoginState.success(userCredential));
      },
      failure: (error) {
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

  Future<void> saveUserUid(String uId) async {
    await SharedPreference.setData(SharedPreferenceKey.userUidKey, uId);
  }
}
