import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/brands/controller/cubit/brand_state.dart';
import 'package:qaf_store/features/screens/brands/data/repository/brands_repository.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';

class BrandCubit extends Cubit<BrandState> {
  final BrandsRepository _brandsRepository;
  BrandCubit(this._brandsRepository) : super(BrandState.initial());

  String? brandName;
  List<ProductModel> productList = [];

  Future<void> getAllBrands() async {
    try {
      emit(BrandState.loading());
      final brands = await _brandsRepository.getAllBrands();
      brands.when(
        success: (brands) {
          brandName = '${brands[0].name} ${brands[0].productsCount}';
          emit(BrandState.loaded(brands));
        },
        failure: (error) {
          emit(BrandState.error(error));
        },
      );
    } catch (error) {
      emit(BrandState.error(error.toString()));
    }
  }

  
}
