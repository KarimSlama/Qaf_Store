import 'package:cloud_firestore/cloud_firestore.dart';

class BannersModel {
  String imageUrl;
  final bool active;
  final String targetScreen;

  BannersModel(
      {required this.imageUrl,
      required this.active,
      required this.targetScreen});

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'Active': active,
      'TargetScreen': targetScreen,
    };
  }

  factory BannersModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return BannersModel(
      imageUrl: data['ImageUrl'] ?? '',
      active: data['Active'] ?? false,
      targetScreen: data['TargetScreen'] ?? '',
    );
  }
}
