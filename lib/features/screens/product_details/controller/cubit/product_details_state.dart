import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState<T> with _$ProductDetailsState<T> {
  const factory ProductDetailsState.initial() = Initial;
  const factory ProductDetailsState.loading() = Loading;
  const factory ProductDetailsState.success(String image) = Success;
  const factory ProductDetailsState.error({required String error}) = Error;
}