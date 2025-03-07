import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = Loading;
  const factory UserState.success(UserModel data) = Success;
  const factory UserState.error({required String error}) = Error;

  const factory UserState.loadingUpdate() = LoadingUpdate;
  const factory UserState.updateSuccess() = UpdateSuccess;
  const factory UserState.updateError({required String error}) = UpdateError;

  const factory UserState.deleteLoading() = DeleteLoading;
  const factory UserState.deleteGoogleSuccess() = DeleteGoogleSuccess;
  const factory UserState.deletePasswordSuccess() = DeletePasswordSuccess;
  const factory UserState.deleteError({required String error}) = DeleteError;

    const factory UserState.reAuthLoading() = ReAuthLoading;
  const factory UserState.reAuthSuccess() = ReAuthSuccess;
  const factory UserState.reAuthError({required String error}) = ReAuthError;

}