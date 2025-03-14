import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
part 'brand_state.freezed.dart';

@freezed
class BrandState with _$BrandState {
  const factory BrandState.initial() = _Initial;
  const factory BrandState.loading() = Loading;
  const factory BrandState.loaded(List<BrandModel> brands) = Loaded;
  const factory BrandState.error(String error) = Error;

  
}
