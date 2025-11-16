import 'package:flutter/services.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:url_launcher/url_launcher.dart';

import '../local_storage/shared_preferences.dart';

class Constants {
  static const String USER_KEY = 'USERKEY';

  static Future<Uint8List> getImageFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (error) {
      throw 'Error loading image data $error';
    }
  }

  static Future<void> launchMyUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variant in product.productVariation!) {
        double priceToConsider =
            variant.salePrice > 0.0 ? variant.salePrice : variant.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice == largestPrice) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  static String? calculateSalePrecentage(
      double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double precentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return precentage.toStringAsFixed(0);
  }

  static String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  static Future<void> saveUserUid(String uId) async {
    await SharedPreference.setSecureString(Constants.USER_KEY, uId);
  }
}
