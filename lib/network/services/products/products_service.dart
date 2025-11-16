import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';

abstract class ProductsService {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> fetchProductByQuery(Query query);
  Future<List<ProductModel>> fetchProductForCategory({
    required String categoryId,
    int limit = 4,
  });
  Future<List<ProductModel>> getProductsByBrand({
    required String brandId,
    int limit = -1,
  });
  Future<List<ProductModel>> favoriteProducts(List<String> productIds);
  Future<void> uploadProducts(List<ProductModel> products);
}