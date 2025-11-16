import 'dart:io';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/network/services/user/user_service.dart';
import 'package:qaf_store/utils/exceptions/firebase_exceptions.dart';

import '../../../../../network/services/user/image_upload_service.dart';

class UserRepository {
  final UserService _userService;
  final ImageUploadService _imageUploadService;

  UserRepository(this._userService, this._imageUploadService);

  Future<ServerResult<UserModel>> fetchUserDetails() async {
    try {
      final user = await _userService.fetchUserDetails();
      return ServerResult.success(user);
    } catch (error) {
      return ServerResult.failure(
          QafExceptionHandler.from(error.toString()).message);
    }
  }

  Future<ServerResult<void>> updateSingleField(Map<String, dynamic> map) async {
    try {
      await _userService.updateSingleField(map);
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(
          'Failed to update field: ${error.toString()}');
    }
  }

  Future<ServerResult<void>> deleteUserAccount(String uId) async {
    try {
      await _userService.removeUserRecord(uId);
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(
          'Failed to delete account: ${error.toString()}');
    }
  }

  Future<ServerResult<void>> reAuthenticateEmailAndPassword(
      String email, String password) async {
    try {
      await _userService.reAuthenticateEmailAndPassword(email, password);
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(
          'Failed to re-authenticate: ${error.toString()}');
    }
  }

  Future<ServerResult<bool>> userExists(String userId) async {
    try {
      final exists = await _userService.userExists(userId);
      return ServerResult.success(exists);
    } catch (error) {
      return ServerResult.failure(
          'Failed to check user existence: ${error.toString()}');
    }
  }

  // New methods for image handling
  Future<ServerResult<File?>> pickProfileImage() async {
    try {
      final image = await _imageUploadService.pickImage();
      return ServerResult.success(image);
    } catch (error) {
      return ServerResult.failure('Failed to pick image: ${error.toString()}');
    }
  }

  Future<ServerResult<String>> uploadAndUpdateProfilePicture(
      File imageFile, String userId) async {
    try {
      // Upload image
      final imageUrl = await _imageUploadService.uploadImage(imageFile);

      if (imageUrl == null) {
        return ServerResult.failure('Failed to upload image');
      }

      // Update user profile
      await _userService.updateSingleField({'ProfilePicture': imageUrl});

      return ServerResult.success(imageUrl);
    } catch (error) {
      return ServerResult.failure(
          'Failed to upload profile picture: ${error.toString()}');
    }
  }
}
