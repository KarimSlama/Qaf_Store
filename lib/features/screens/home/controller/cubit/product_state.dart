import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/home/data/models/banners_model.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.categoryLoading() = CategoryLoading;
  const factory ProductState.categorySuccess(List<CategoryModel> categories) = CategorySuccess;
  const factory ProductState.categoryError(String errorMessage) = CategoryError;

  const factory ProductState.bannersLoading() = BannersLoading;
  const factory ProductState.bannersSuccess(List<BannersModel> banners) = BannersSuccess;
  const factory ProductState.bannersError(String errorMessage) = BannersError;

  const factory ProductState.productsLoading() = ProductsLoading;
  const factory ProductState.productsSuccess(List<ProductModel> products) = ProductsSuccess;
  const factory ProductState.productsError(String errorMessage) = ProductsError;

  const factory ProductState.categoryProductsLoading() = CategoryProductsLoading;
  const factory ProductState.categoryProductsSuccess(List<ProductModel> products) = CategoryProductsSuccess;
  const factory ProductState.categoryProductsError(String errorMessage) = CategoryProductsError;
}