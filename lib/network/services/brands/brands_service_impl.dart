import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/network/services/brands/brands_service.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:qaf_store/utils/constants/constants.dart';

class BrandsServiceImpl implements BrandsService {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<ServerResult<List<BrandModel>>> getBrands() async {
    try {
      final brandsSnapshot = await _firestore.collection('Brands').get();
      final list = brandsSnapshot.docs
          .map((document) => BrandModel.fromSnapshot(document))
          .toList();
      final brands = list.where((brand) {
        return brand.isFeatured ?? false;
      }).toList();
      return ServerResult.success(brands);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<List<BrandModel>>> getBrandForCategory(
      String categoryId) async {
    try {
      final brandCategoryQuery = await _firestore
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      final List<String> brandId = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();
      final brandQuery = await _firestore
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandId)
          .get();
      final List<BrandModel> brands =
          brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return ServerResult.success(brands);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> uploadBrands(List<BrandModel> brands) async {
    try {
      List<Future<void>> uploadBrands = [];

      for (var brand in brands) {
        uploadBrands.add(_uploadSingleBrand(brand));
      }

      await Future.wait(uploadBrands);

      return ServerResult.success(uploadBrands);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<void> _uploadSingleBrand(BrandModel brand) async {
    final file = await Constants.getImageFromAssets(brand.image);
    final url = await uploadBrandsImage(file);
    if (url == null) throw Exception("Failed to upload brand image");

    brand.image = url;
    await _firestore.collection('Brands').doc(brand.id).set(brand.toJson());
  }

  Future<String?> uploadBrandsImage(Uint8List imageFile) async {
    try {
      final String cloudName = "doqriqoig";
      final String apiKey = "746381528264786";
      final String apiSecret = "HX5AO_VdKbssfo0o9RH8NnL9Q2I";
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String folder = "home/brands";

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
