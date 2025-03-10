import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/network/services/products/products_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class ProductsRepository {
  final ProductsService productsService;

  ProductsRepository(this.productsService);

  Future<ServerResult<List<ProductModel>>> getAllProducts() async {
    try {
      final products = await productsService.getAllProducts();
      return products.when(
        success: (product) {
          return ServerResult.success(product);
        },
        failure: (error) {
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> uploadProducts(List<ProductModel> products) async {
    try {
      final productResponse = await productsService.uploadProducts(products);
      return productResponse.when(
        success: (data) {
          return ServerResult.success(data);
        },
        failure: (error) {
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<ProductModel>>> fetchProductByQuery(
      Query? query) async {
    try {
      if (query == null) return ServerResult.failure('Exception query is null');

      final product = await productsService.fetchProductByQuery(query);

      return product.when(
          success: (data) => ServerResult.success(data),
          failure: (error) {
            return ServerResult.failure(error.toString());
          });
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
