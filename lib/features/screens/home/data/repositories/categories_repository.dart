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
          print('the category fetched in category repo is ${category.first}');
          return ServerResult.success(category);
        },
        failure: (error) {
          print('the error with category repository is ${error.toString()}');
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      print(
          'the error catched with category repository is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> uploadCategories(
      List<CategoryModel> categories) async {
    try {
      final response = await categoriesService.uploadCategories(categories);
      return response.when(
        success: (category) {
          print('the category uploaded in category repo is');
          return ServerResult.success(category);
        },
        failure: (error) {
          print(
              'the error with upload category repository is ${error.toString()}');
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      print(
          'the error catched with upload category repository is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }
}
