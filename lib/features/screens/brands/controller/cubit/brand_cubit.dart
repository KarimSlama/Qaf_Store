import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/brands/controller/cubit/brand_state.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/features/screens/brands/data/repository/brands_repository.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';

class BrandCubit extends Cubit<BrandState> {
  final BrandsRepository _brandsRepository;
  BrandCubit(this._brandsRepository) : super(BrandState.initial());

  List<ProductModel> productList = [];
  List<BrandModel> brandList = [];

  Future<void> getAllBrands() async {
    try {
      emit(BrandState.brandsLoading());
      final brands = await _brandsRepository.getAllBrands();
      brands.when(
        success: (brands) {
          brandList = brands;
          emit(BrandState.brandsLoaded(brands));
        },
        failure: (error) {
          emit(BrandState.error(error));
        },
      );
    } catch (error) {
      emit(BrandState.error(error.toString()));
    }
  }

  Future<void> fetchBrandForCategory(String categoryId) async {
    try {
      emit(BrandState.brandsForCategoryLoading());
      final brands = await _brandsRepository.getBrandForCategory(categoryId);
      brands.when(
        success: (brands) {
          brandList = brands;
          emit(BrandState.brandsForCategoryLoaded(brands));
        },
        failure: (error) {
          emit(BrandState.error(error));
        },
      );
    } catch (error) {
      emit(BrandState.error(error.toString()));
    }
  }
  void assignBrandCategory(List<BrandModel> brands) {
    brandList = brands;
    emit(BrandState.brandsForCategoryLoaded(List.from(brandList)));
  }
}