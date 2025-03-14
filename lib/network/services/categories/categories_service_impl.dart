import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/network/services/categories/categories_service.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class CategoriesServiceImpl implements CategoriesService {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<ServerResult<List<CategoryModel>>> getAllCategories() async {
    try {
      final snapshot = await _firestore.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      final categories = list
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList();
      return ServerResult.success(categories);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> uploadCategories(
      List<CategoryModel> categories) async {
    try {
      List<Future<void>> uploadTasks = [];

      for (var category in categories) {
        uploadTasks.add(_uploadSingleCategory(category));
      }

      await Future.wait(uploadTasks);

      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<void> _uploadSingleCategory(CategoryModel category) async {
    final file = await Constants.getImageFromAssets(category.image);
    final url = await uploadCategoryImage(file);
    if (url == null) throw Exception("Failed to upload category image");

    category.image = url;
    await _firestore
        .collection('Categories')
        .doc(category.id)
        .set(category.toJson());
  }

  Future<String?> uploadCategoryImage(Uint8List imageFile) async {
    try {
      final String cloudName = "doqriqoig";
      final String apiKey = "746381528264786";
      final String apiSecret = "HX5AO_VdKbssfo0o9RH8NnL9Q2I";
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String folder = "home/categories";

      final String stringToSign =
          "folder=$folder&timestamp=$timestamp$apiSecret";
      final String signature =
          sha1.convert(utf8.encode(stringToSign)).toString();

      final uri =
          Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");
      final fileName = "category_${DateTime.now().millisecondsSinceEpoch}.png";

      final request = http.MultipartRequest("POST", uri)
        ..fields['api_key'] = apiKey
        ..fields['timestamp'] = timestamp
        ..fields['signature'] = signature
        ..fields['folder'] = folder
        ..files.add(http.MultipartFile.fromBytes(
          "file",
          imageFile,
          filename: fileName,
          contentType: MediaType('image', 'png'),
        ));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseData);

      if (response.statusCode == 200) {
        return jsonResponse["secure_url"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
