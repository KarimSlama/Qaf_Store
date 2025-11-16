import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/network/services/products/products_service.dart';
import 'package:qaf_store/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:qaf_store/utils/constants/enum.dart';

class ProductsServiceImpl implements ProductsService {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await _firestore
        .collection('Products')
        .where('IsFeatured', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((document) => ProductModel.fromSnapshot(document))
        .toList();
  }

  @override
  Future<List<ProductModel>> fetchProductForCategory({
    required String categoryId,
    int limit = 4,
  }) async {
    final query = limit == -1
        ? _firestore
            .collection('Products')
            .where('CategoryId', isEqualTo: categoryId)
        : _firestore
            .collection('Products')
            .where('CategoryId', isEqualTo: categoryId)
            .limit(limit);

    final snapshot = await query.get();

    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  @override
  Future<List<ProductModel>> getProductsByBrand({
    required String brandId,
    int limit = -1,
  }) async {
    final query = limit == -1
        ? _firestore
            .collection('Products')
            .where('Brand.Id', isEqualTo: brandId)
        : _firestore
            .collection('Products')
            .where('Brand.Id', isEqualTo: brandId)
            .limit(limit);

    final querySnapshot = await query.get();

    return querySnapshot.docs
        .map((doc) => ProductModel.fromSnapshot(doc))
        .toList();
  }

  @override
  Future<void> uploadProducts(List<ProductModel> products) async {
    List<Future<void>> uploadTasks = [];

    for (var product in products) {
      uploadTasks.add(_uploadSingleProduct(product));
    }

    await Future.wait(uploadTasks);
  }

  Future<void> _uploadSingleProduct(ProductModel product) async {
    final file = await Constants.getImageFromAssets(product.thumbnail);
    final url = await uploadProductImage(file);
    if (url == null) throw Exception("Failed to upload product image");

    product.thumbnail = url;

    if (product.images != null && product.images!.isNotEmpty) {
      List<String> imageUrl = [];
      for (var image in product.images!) {
        final assetImage = await Constants.getImageFromAssets(image);
        final productImageUrl = await uploadProductImage(assetImage);

        imageUrl.add(productImageUrl!);
      }
      product.images!.clear();
      product.images!.addAll(imageUrl);
    }

    if (product.productType == ProductType.variable.toString()) {
      for (var variant in product.productVariation!) {
        final assetImage = await Constants.getImageFromAssets(variant.image);
        final url = await uploadProductImage(assetImage);
        variant.image = url!;
      }
    }

    await _firestore
        .collection('Products')
        .doc(product.id)
        .set(product.toJson());
  }

  Future<String?> uploadProductImage(Uint8List imageFile) async {
    try {
      final String cloudName = "doqriqoig";
      final String apiKey = "746381528264786";
      final String apiSecret = "HX5AO_VdKbssfo0o9RH8NnL9Q2I";
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String folder = "home/products";

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

  @override
  Future<List<ProductModel>> fetchProductByQuery(Query<Object?> query) async {
    final querySnapshot = await query.get();

    return querySnapshot.docs
        .map((doc) => ProductModel.fromQuerySnapshot(doc))
        .toList();
  }

  @override
  Future<List<ProductModel>> favoriteProducts(List<String> productIds) async {
    if (productIds.isEmpty) {
      return [];
    }

    if (productIds.length > 10) {
      productIds = productIds.take(10).toList();
    }

    final snapshot = await _firestore
        .collection('Products')
        .where(FieldPath.documentId, whereIn: productIds)
        .get();

    return snapshot.docs
        .map((product) => ProductModel.fromSnapshot(product))
        .toList();
  }
}
