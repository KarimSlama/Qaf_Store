import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_state.freezed.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.initial() = _Initial;
  const factory UploadState.categoryLoading() = CategoryLoading;
  const factory UploadState.categorySuccess() =
      CategorySuccess;
  const factory UploadState.categoryError(String error) = CategoryError;

   const factory UploadState.bannerLoading() = BannerLoading;
  const factory UploadState.bannerSuccess() =
      BannerSuccess;
  const factory UploadState.bannerError(String error) =BannerError;

   const factory UploadState.productLoading() = ProductLoading;
  const factory UploadState.productSuccess() =
      ProductSuccess;
  const factory UploadState.productryError(String error) = ProductError;

  const factory UploadState.brandsLoading() = BrandsLoading;
  const factory UploadState.brandsSuccess() = BrandsSuccess;
  const factory UploadState.brandsError(String error) = BrandsError;
}
