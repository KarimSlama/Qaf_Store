import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/forgot_password/controller/cubit/reset_password_state.dart';
import 'package:qaf_store/features/screens/forgot_password/data/repository/reset_password_email_repository.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/exceptions/firebase_auth_exceptions.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordEmailRepository resetPasswordEmailRepository;
  ResetPasswordCubit(this.resetPasswordEmailRepository)
      : super(ResetPasswordState.initial());

  final TextEditingController emailController = TextEditingController();
  final resetFormKey = GlobalKey<FormState>();

  Future<void> resetPasswordEmail(context) async {
    try {
      emit(ResetPasswordState.loading());
      final result = await resetPasswordEmailRepository
          .resetPasswordEmail(emailController.text.trim());

      result.when(
        success: (_) {
          Loaders.successSnackBar(
              context: context,
              title: QafStrings.congratulations,
              message: QafStrings.yourPasswordResetEmailHasBeenCheckYourEmails);
          emit(ResetPasswordState.success(emailController.text.trim()));
        },
        failure: (error) {
          print('the error with reset password is ${error.toString()}');
          emit(ResetPasswordState.error(error: error));
        },
      );
    } on FirebaseAuthException catch (error) {
      final errorMessage = QafFirebaseAuthException(error.code).message;
      emit(ResetPasswordState.error(error: errorMessage));
      Loaders.errorSnackBar(
          context: context, title: QafStrings.error, message: errorMessage);
    } on FirebaseException catch (error) {
      final errorMessage = QafFirebaseAuthException(error.code).message;
      emit(ResetPasswordState.error(error: errorMessage));
      Loaders.errorSnackBar(
          context: context, title: QafStrings.error, message: errorMessage);
    } catch (error) {
      emit(ResetPasswordState.error(error: error.toString()));
      Loaders.errorSnackBar(
          context: context, title: QafStrings.error, message: error.toString());
    }
  }

}
