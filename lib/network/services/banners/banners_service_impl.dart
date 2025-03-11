import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:qaf_store/features/screens/home/data/models/banners_model.dart';
import 'package:qaf_store/network/services/banners/banners_service.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:qaf_store/utils/constants/constants.dart';

class BannersServiceImpl implements BannersService {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<ServerResult<List<BannersModel>>> fetchBanners() async {
    try {
      final banners = await _firestore
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      final result = banners.docs
          .map((banner) => BannersModel.fromSnapshot(banner))
          .toList();
      return ServerResult.success(result);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> uploadBanners(List<BannersModel> banners) async {
    try {
      List<Future<void>> uploadTasks = [];

      for (var banner in banners) {
        uploadTasks.add(_uploadSingleBanner(banner));
      }

      await Future.wait(uploadTasks);

      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<void> _uploadSingleBanner(BannersModel banners) async {
    final file = await Constants.getImageFromAssets(banners.imageUrl);
    final url = await uploadBannerImage(file);
    if (url == null) throw Exception("Failed to upload banner image");

    banners.imageUrl = url;
    await _firestore.collection('Banners').doc().set(banners.toJson());
  }

  Future<String?> uploadBannerImage(Uint8List imageFile) async {
    try {
      final String cloudName = "doqriqoig";
      final String apiKey = "746381528264786";
      final String apiSecret = "HX5AO_VdKbssfo0o9RH8NnL9Q2I";
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String folder = "home/banners";

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
        print('Uploaded successfully: ${jsonResponse["secure_url"]}');
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
