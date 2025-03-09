import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_attribute_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_variation_model.dart';

class ProductModel {
  final String id;
  final int stock;
  final String? sku;
  final double price;
  final String title;
  final DateTime? date;
  final double salePrice;
  String thumbnail;
  final bool? isFeatured;
  final BrandModel? brand;
  final String? description;
  final String? categoryId;
  final List<String>? images;
  final String? productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariation;

  ProductModel({
    required this.id,
    required this.stock,
    required this.price,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.categoryId,
    this.sku,
    this.date,
    this.salePrice = 0.0,
    this.isFeatured,
    this.brand,
    this.images,
    this.productType,
    this.productAttributes,
    this.productVariation,
  });

  static ProductModel empty() => ProductModel(
      id: '',
      stock: 0,
      price: 0,
      title: '',
      thumbnail: '',
      description: '',
      categoryId: '',
      productType: '');

  Map<String, dynamic> toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnails': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((element) => element.toJson()).toList()
          : [],
      'ProductVariation': productVariation != null
          ? productVariation!.map((element) => element.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      sku: data['SKU'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse(
        (data['SalePrice'] ?? 0.0).toString(),
      ),
      title: data['Title'],
      thumbnail: data['Thumbnails'] ?? '',
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      isFeatured: data['IsFeatured'] ?? false,
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((element) => ProductAttributeModel.fromJson(element))
          .toList(),
      productVariation: (data['ProductVariation'] as List<dynamic>)
          .map((element) => ProductVariationModel.fromJson(element))
          .toList(),
    );
  }
}
