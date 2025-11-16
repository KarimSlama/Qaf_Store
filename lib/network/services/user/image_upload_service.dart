import 'dart:io';

abstract class ImageUploadService {
  Future<File?> pickImage();
  Future<String?> uploadImage(File imageFile);
}
