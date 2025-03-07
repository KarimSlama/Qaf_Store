import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_social_repository.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_state.dart';
import 'package:qaf_store/features/screens/profile/data/repository/user_repository.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/gen/assets.gen.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  final LoginSocialRepository loginSocialRepository;
  UserCubit(this.userRepository, this.loginSocialRepository)
      : super(UserState.initial());

  final nameFormKey = GlobalKey<FormState>();
  final authFormKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserModel userModel = UserModel.empty();
  Future<void> fetchUserDetails() async {
    try {
      emit(UserState.loading());
      final result = await userRepository.fetchUserDetails();
      result.when(
        success: (user) {
          userModel = user;
          initializeNameFields(user.firstName, user.lastName);
          emit(UserState.success(user));
        },
        failure: (error) {
          emit(UserState.error(error: error));
        },
      );
    } catch (error) {
      emit(UserState.error(error: error.toString()));
    }
  }

  void initializeNameFields(firstName, lastName) {
    firstNameController.text = firstName;
    lastNameController.text = lastName;
  }

  Future<void> updateName() async {
    if (!nameFormKey.currentState!.validate()) return;
    emit(UserState.loadingUpdate());

    try {
      final Map<String, dynamic> name = {
        'FirstName': firstNameController.text.trim(),
        'LastName': lastNameController.text.trim()
      };
      final result = await userRepository.updateSingleField(name);
      result.when(
        success: (data) {
          emit(UserState.updateSuccess());
        },
        failure: (error) {
          emit(UserState.updateError(error: error));
        },
      );
    } catch (error) {
      emit(UserState.updateError(error: error.toString()));
    }
  }

  void deleteUserAccount(context) async {
    try {
      emit(UserState.deleteLoading());
      FullScreenLoader.openLoadingDialog(
          'We are Proccessing your information....',
          Assets.images.animations.a141594AnimationOfDocer,
          context);
      final provider = FirebaseAuth.instance.currentUser!.providerData
          .map((row) => row.providerId)
          .first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await loginSocialRepository.loginWithSocial();
          await userRepository.deleteUserAccount(userModel.id!);
          FullScreenLoader.stopLoading(context);
          emit(UserState.deleteGoogleSuccess());
          return;
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading(context);
          emit(UserState.deletePasswordSuccess());
          return;
        }
      }
      emit(UserState.deleteError(error: 'no item found to delete'));
    } catch (error) {
      emit(UserState.deleteError(error: error.toString()));
    }
  }

  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      emit(UserState.reAuthLoading());
      if (!authFormKey.currentState!.validate()) return;
      final user = await userRepository.reAuthenticateEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      user.when(
        success: (data) async{
          await userRepository.deleteUserAccount(userModel.id!);
          emit(UserState.reAuthSuccess());
        },
        failure: (error) {
          emit(UserState.reAuthError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(UserState.reAuthError(error: error.toString()));
    }
  }
}
