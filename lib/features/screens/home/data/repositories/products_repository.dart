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
      return ServerResult.success(products);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<ProductModel>>> fetchProductForCategory({
    required String categoryId,
    int limit = 4,
  }) async {
    try {
      final products = await productsService.fetchProductForCategory(
        categoryId: categoryId,
        limit: limit,
      );
      return ServerResult.success(products);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<ProductModel>>> getBrandProducts({
    required String brandId,
  }) async {
    try {
      final products = await productsService.getProductsByBrand(
        brandId: brandId,
      );
      return ServerResult.success(products);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> uploadProducts(List<ProductModel> products) async {
    try {
      await productsService.uploadProducts(products);
      return const ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<ProductModel>>> fetchProductByQuery(
    Query? query,
  ) async {
    try {
      if (query == null) {
        return const ServerResult.failure('Query is null');
      }

      final products = await productsService.fetchProductByQuery(query);
      return ServerResult.success(products);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<ProductModel>>> fetchFavoriteProducts(
    List<String> productIds,
  ) async {
    try {
      final products = await productsService.favoriteProducts(productIds);
      return ServerResult.success(products);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
