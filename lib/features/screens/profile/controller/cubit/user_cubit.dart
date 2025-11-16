import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_social_repository.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_state.dart';
import 'package:qaf_store/features/screens/profile/data/repository/user_repository.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  final LoginSocialRepository _loginSocialRepository;

  UserCubit(this._userRepository, this._loginSocialRepository)
      : super(UserState.initial());

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Future<void> fetchUserDetails() async {
    emit(UserState.loading());

    final result = await _userRepository.fetchUserDetails();

    result.when(
      success: (user) {
        _currentUser = user;
        emit(UserState.success(user));
      },
      failure: (error) {
        emit(UserState.error(error: error));
      },
    );
  }

  Future<void> updateName(String firstName, String lastName) async {
    if (firstName.trim().isEmpty || lastName.trim().isEmpty) {
      emit(UserState.updateError(error: 'Name fields cannot be empty'));
      return;
    }

    emit(UserState.loadingUpdate());

    final Map<String, dynamic> name = {
      'FirstName': firstName.trim(),
      'LastName': lastName.trim(),
    };

    final result = await _userRepository.updateSingleField(name);

    result.when(
      success: (_) {
        _currentUser = _currentUser?.copyWith(
          firstName: firstName.trim(),
          lastName: lastName.trim(),
        );
        emit(UserState.updateSuccess());
      },
      failure: (error) {
        emit(UserState.updateError(error: error));
      },
    );
  }

  Future<void> uploadProfilePicture() async {
    emit(UserState.uploadImageLoading());

    final imageResult = await _userRepository.pickProfileImage();

    File? imageFile;
    imageResult.when(
      success: (image) => imageFile = image,
      failure: (error) {
        emit(UserState.uploadImageError(error: error));
        return;
      },
    );

    if (imageFile == null) {
      if (_currentUser != null) {
        emit(UserState.success(_currentUser!));
      } else {
        await fetchUserDetails();
      }
      return;
    }

    final uploadResult = await _userRepository.uploadAndUpdateProfilePicture(
      imageFile!,
      _currentUser?.id ?? '',
    );

    uploadResult.when(
      success: (imageUrl) {
        _currentUser = _currentUser?.copyWith(profilePicture: imageUrl);
        emit(UserState.success(_currentUser!));
      },
      failure: (error) {
        emit(UserState.uploadImageError(error: error));
      },
    );
  }

  Future<void> deleteUserAccount() async {
    emit(UserState.deleteLoading());

    final provider = FirebaseAuth.instance.currentUser?.providerData
        .map((row) => row.providerId)
        .firstOrNull;

    if (provider == null || provider.isEmpty) {
      emit(UserState.deleteError(error: 'No authentication provider found'));
      return;
    }

    if (provider == 'google.com') {
      await _loginSocialRepository.loginWithGoogle();

      final result =
          await _userRepository.deleteUserAccount(_currentUser?.id ?? '');

      result.when(
        success: (_) => emit(UserState.deleteGoogleSuccess()),
        failure: (error) => emit(UserState.deleteError(error: error)),
      );
    } else if (provider == 'password') {
      emit(UserState.deletePasswordSuccess());
    } else {
      emit(UserState.deleteError(error: 'Unsupported authentication provider'));
    }
  }

  Future<void> reAuthenticateAndDelete(String email, String password) async {
    emit(UserState.reAuthLoading());

    if (email.trim().isEmpty || password.trim().isEmpty) {
      emit(UserState.reAuthError(error: 'Email and password are required'));
      return;
    }

    final authResult = await _userRepository.reAuthenticateEmailAndPassword(
      email.trim(),
      password.trim(),
    );

    await authResult.when(
      success: (_) async {
        final deleteResult = await _userRepository.deleteUserAccount(
          _currentUser?.id ?? '',
        );

        deleteResult.when(
          success: (_) => emit(UserState.reAuthSuccess()),
          failure: (error) => emit(UserState.reAuthError(error: error)),
        );
      },
      failure: (error) {
        emit(UserState.reAuthError(error: error));
      },
    );
  }
}
