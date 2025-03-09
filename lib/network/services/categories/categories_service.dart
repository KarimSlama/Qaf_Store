import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class CategoriesService {
  Future<ServerResult<List<CategoryModel>>> getAllCategories();
  Future<ServerResult<void>> uploadCategories(List<CategoryModel> categories); 
}
