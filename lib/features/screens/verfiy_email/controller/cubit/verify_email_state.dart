import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_email_state.freezed.dart';

@freezed
class VerifyEmailState<T> with _$VerifyEmailState{
  const factory VerifyEmailState.initial() = _Initial;
  const factory VerifyEmailState.loading() = VerifyLoading;
  const factory VerifyEmailState.success() = VerifySuccess<T>;
  const factory VerifyEmailState.verificationSuccess() = VerificationVerifiedSuccess<T>;
  const factory VerifyEmailState.error({required String error}) = VerifyError;
}