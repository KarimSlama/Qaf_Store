import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/verfiy_email/controller/cubit/verify_email_state.dart';
import 'package:qaf_store/features/screens/verfiy_email/data/repository/verify_email_repository.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyEmailRepository verifyEmailRepository;
  VerifyEmailCubit(this.verifyEmailRepository)
      : super(VerifyEmailState.initial()) {
    sendVerifyEmail();
    setTimerForAutoRedirect();
  }

  Future<void> sendVerifyEmail() async {
    final result = await verifyEmailRepository.verifyEmail();

    result.when(
      success: (data) {
        emit(VerifyEmailState.success());
      },
      failure: (error) {
        emit(VerifyEmailState.error(error: error));
      },
    );
  }

  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        emit(VerificationVerifiedSuccess());
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      emit(VerificationVerifiedSuccess());
    }
  }
}
