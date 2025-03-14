import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class ProductsService {
  Future<ServerResult<List<ProductModel>>> getAllProducts();
  Future<ServerResult<List<ProductModel>>> fetchProductByQuery(Query query);
  Future<ServerResult<List<ProductModel>>> getProductsByBrand(
      {required String brandId, int limit = -1});
  Future<ServerResult<void>> uploadProducts(List<ProductModel> products);
}
