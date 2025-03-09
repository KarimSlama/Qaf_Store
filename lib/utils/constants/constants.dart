import 'package:flutter/services.dart';

class Constants {
  static String? userKey;

  static Future<Uint8List> getImageFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
          // print('the image success when getimagefromassets is ${imageData}');
      return imageData;
    } catch (error) {
      print('the error with getimagefromassets is $error');
      throw 'Error loading image data $error';
    }
  }
}
