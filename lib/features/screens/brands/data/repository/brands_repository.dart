import 'package:qaf_store/network/services/brands/brands_service.dart';
import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';

class BrandsRepository {
  final BrandsService _brandsService;

  const BrandsRepository(this._brandsService);

  Future<ServerResult<List<BrandModel>>> getAllBrands() async {
    try {
      final brands = await _brandsService.getBrands();

      return brands.when(
        success: (brands) {
          return ServerResult.success(brands);
        },
        failure: (error) {
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<BrandModel>>> getBrandForCategory(
      String categoryId) async {
    try {
      final brand = await _brandsService.getBrandForCategory(categoryId);
      return brand.when(
        success: (brands) {
          return ServerResult.success(brands);
        },
        failure: (error) {
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> uploadBrands(List<BrandModel> brands) async {
    try {
      final response = await _brandsService.uploadBrands(brands);
      return response.when(
        success: (brand) {
          return ServerResult.success(brand);
        },
        failure: (error) {
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
