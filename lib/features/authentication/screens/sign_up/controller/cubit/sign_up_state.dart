import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(T data) = Success<T>;
  const factory SignUpState.passwordChanged({required bool isPassword}) =
      Changed;
  const factory SignUpState.checkboxChanged({required bool isCheck}) = Checked;
  const factory SignUpState.error({required String error}) = Error;
}
