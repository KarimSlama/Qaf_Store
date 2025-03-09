import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/full_screen_loader.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_social_repository.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_state.dart';
import 'package:qaf_store/features/screens/profile/data/repository/user_repository.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:crypto/crypto.dart';

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
        success: (data) async {
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

  Future<File?> uploadUserProfilePicture(context) async {
    try {
      emit(UserState.uploadImageLoading());
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image == null) {
        emit(UserState.success(userModel));
        return null;
      }
      final imageUrl = await uploadImageToCloudinary(image);

      if (imageUrl != null) {
        userRepository.updateSingleField({'ProfilePicture': imageUrl});
        userModel = userModel.copyWith(profilePicture: imageUrl);
       
        emit(UserState.success(userModel));
      } else {
        emit(UserState.uploadImageError(error: 'Failed to upload image'));
      }
    } catch (error) {
      emit(UserState.uploadImageError(error: error.toString()));
    }
    return null;
  }

  Future<String?> uploadImageToCloudinary(XFile? imageFile) async {
    try {
      final String cloudName = "doqriqoig";
      final String apiKey = "746381528264786";
      final String apiSecret = "HX5AO_VdKbssfo0o9RH8NnL9Q2I";
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String folder = "home/profile_image";

      final String stringToSign =
          "folder=$folder&timestamp=$timestamp$apiSecret";
      final String signature =
          sha1.convert(utf8.encode(stringToSign)).toString();

      final uri =
          Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");

      final request = http.MultipartRequest("POST", uri)
        ..fields['api_key'] = apiKey
        ..fields['timestamp'] = timestamp
        ..fields['signature'] = signature
        ..fields['folder'] = folder
        ..files.add(await http.MultipartFile.fromPath("file", imageFile!.path));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseData);

      if (response.statusCode == 200) {
        return jsonResponse["secure_url"];
      } else {
        print("Error uploading image: ${jsonResponse['error']['message']}");
        return null;
      }
    } catch (e) {
      print("Exception uploading image: $e");
      return null;
    }
  }
}
