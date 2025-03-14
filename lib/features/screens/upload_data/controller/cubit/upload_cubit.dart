import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/home/data/repositories/banners_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/categories_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/products_repository.dart';
import 'package:qaf_store/features/screens/upload_data/controller/cubit/upload_state.dart';
import 'package:qaf_store/utils/dummy_data.dart';
import 'package:qaf_store/features/screens/brands/data/repository/brands_repository.dart';

class UploadCubit extends Cubit<UploadState> {
  final CategoriesRepository categoriesRepository;
  final ProductsRepository productsRepository;
  final BannersRepository bannersRepository;
  final BrandsRepository brandsRepository;
  UploadCubit(this.categoriesRepository, this.productsRepository, this.bannersRepository, this.brandsRepository)
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
          emit(UploadState.categoryError(error));
        },
      );
    } catch (error) {
      emit(UploadState.categoryError(error.toString()));
    }
  }

  Future<void> uploadBanners() async {
    try {
      emit(UploadState.bannerLoading());
      final result =
          await bannersRepository.uploadBanners(DummyData.banners);
      result.when(
        success: (data) {
          emit(UploadState.bannerSuccess());
        },
        failure: (error) {
          emit(UploadState.bannerError(error));
        },
      );
    } catch (error) {
      emit(UploadState.bannerError(error.toString()));
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
          emit(UploadState.productryError(error));
        },
      );
    } catch (error) {
      emit(UploadState.productryError(error.toString()));
    }
  }

  Future<void> uploadBrands() async {
    try {
      emit(UploadState.brandsLoading());
      final result =
          await brandsRepository.uploadBrands(DummyData.brands);
      result.when(
        success: (data) {
          emit(UploadState.brandsSuccess());
        },
        failure: (error) {
          emit(UploadState.brandsError(error));
        },
      );
    } catch (error) {
      emit(UploadState.brandsError(error.toString()));
    }
  }
}
