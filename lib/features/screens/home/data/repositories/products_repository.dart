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
          print('the product with products repo is ${product[0].title}');
          return ServerResult.success(product);
        },
        failure: (error) {
          print('the failure error is $error');
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      print('the failure error is $error');
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> uploadProducts(List<ProductModel> products) async {
    try {
      final productResponse = await productsService.uploadProducts(products);
      return productResponse.when(
        success: (data) {
          print('the product with upload products repo');
          return ServerResult.success(data);
        },
        failure: (error) {
          print('the failure error is $error');
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      print('the failure error is $error');
      return ServerResult.failure(error.toString());
    }
  }
}
