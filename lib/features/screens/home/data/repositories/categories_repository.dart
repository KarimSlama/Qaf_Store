import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/network/services/categories/categories_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class CategoriesRepository {
  final CategoriesService categoriesService;

  CategoriesRepository(this.categoriesService);

  Future<ServerResult<List<CategoryModel>>> fetchAllCategories() async {
    try {
      final categories = await categoriesService.getAllCategories();
      return categories.when(
        success: (category) {
          return ServerResult.success(category);
        },
        failure: (error) {
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<CategoryModel>>> fetchSubCategories(
      String categoryId) async {
    try {
      final category = await categoriesService.getSubCategories(categoryId);
      return category.when(
        success: (category) {
          return ServerResult.success(category);
        },
        failure: (error) {
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> uploadCategories(
      List<CategoryModel> categories) async {
    try {
      final response = await categoriesService.uploadCategories(categories);
      return response.when(
        success: (category) {
          return ServerResult.success(category);
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
