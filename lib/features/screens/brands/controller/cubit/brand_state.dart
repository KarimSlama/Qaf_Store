import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';

part 'brand_state.freezed.dart';

@freezed
class BrandState with _$BrandState {
  const factory BrandState.initial() = _Initial;

  const factory BrandState.brandsLoading() = BrandsLoading;
  const factory BrandState.brandsLoaded(List<BrandModel> brands) = BrandsLoaded;

  const factory BrandState.productsLoading() = ProductsLoading;
  const factory BrandState.productsLoaded(List<ProductModel> products) = ProductsLoaded;

  const factory BrandState.brandsForCategoryLoading() = BrandsForCategoryLoading;
  const factory BrandState.brandsForCategoryLoaded(List<BrandModel> brands) = BrandsForCategoryLoaded;

  const factory BrandState.error(String error) = Error;
}