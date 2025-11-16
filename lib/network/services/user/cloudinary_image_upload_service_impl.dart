import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:qaf_store/network/services/user/image_upload_service.dart';

class CloudinaryImageService implements ImageUploadService {
  final String cloudName;
  final String apiKey;
  final String apiSecret;
  final String folder;

  CloudinaryImageService({
    required this.cloudName,
    required this.apiKey,
    required this.apiSecret,
    required this.folder,
  });

  @override
  Future<File?> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image == null) return null;

      return File(image.path);
    } catch (e) {
      throw Exception('Failed to pick image: ${e.toString()}');
    }
  }

  @override
  Future<String?> uploadImage(File imageFile) async {
    try {
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
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
        ..files.add(await http.MultipartFile.fromPath("file", imageFile.path));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseData);

      if (response.statusCode == 200) {
        return jsonResponse["secure_url"];
      } else {
        throw Exception('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to upload image: ${e.toString()}');
    }
  }
}
