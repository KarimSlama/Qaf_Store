import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/home/data/repositories/categories_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/products_repository.dart';
import 'package:qaf_store/features/screens/upload_data/controller/cubit/upload_state.dart';
import 'package:qaf_store/utils/dummy_data.dart';

class UploadCubit extends Cubit<UploadState> {
  final CategoriesRepository categoriesRepository;
  final ProductsRepository productsRepository;
  UploadCubit(this.categoriesRepository, this.productsRepository)
      : super(UploadState.initial());

  Future<void> uploadCategories() async {
    try {
      emit(UploadState.categoryLoading());
      final result =
          await categoriesRepository.uploadCategories(DummyData.categories);
      result.when(
        success: (data) {
          emit(UploadState.categorySuccess());
        },
        failure: (error) {
          print('the error with upload category is $error');
          emit(UploadState.categoryError(error));
        },
      );
    } catch (error) {
      print('the error with catch upload category is $error');
      emit(UploadState.categoryError(error.toString()));
    }
  }

  Future<void> uploadProducts() async {
    try {
      emit(UploadState.productLoading());
      final result =
          await productsRepository.uploadProducts(DummyData.products);
      result.when(
        success: (data) {
          emit(UploadState.productSuccess());
        },
        failure: (error) {
          print('the error with upload products is $error');
          emit(UploadState.productryError(error));
        },
      );
    } catch (error) {
      print('the error with catch upload products is $error');
      emit(UploadState.productryError(error.toString()));
    }
  }
}
