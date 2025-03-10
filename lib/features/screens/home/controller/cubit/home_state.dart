import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/home/data/models/banners_model.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.carouselChanged(int carouselCurrentIndex) = CarouselChanged;

  const factory HomeState.categoryLoading() = CategoryLoading;
  const factory HomeState.categorySuccess(List<CategoryModel> categories) = CategorySuccess;
  const factory HomeState.categoryError(String error) = CategoryError;

  const factory HomeState.bannersLoading() = BannersLoading;
  const factory HomeState.bannersSuccess(List<BannersModel> banners) = BannersSuccess;
  const factory HomeState.bannersError(String error) = BannersError;

  const factory HomeState.productsLoading() = ProductsLoading;
  const factory HomeState.productsSuccess(List<ProductModel> products) = ProductsSuccess;
  const factory HomeState.productsError(String error) = ProductsError;

  
}
