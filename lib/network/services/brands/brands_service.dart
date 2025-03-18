import 'package:qaf_store/network/services/server_result.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';

abstract class BrandsService {
  Future<ServerResult<List<BrandModel>>> getBrands();
  Future<ServerResult<List<BrandModel>>> getBrandForCategory(String categoryId);
      



  Future<ServerResult<void>> uploadBrands(List<BrandModel> brands);
}
