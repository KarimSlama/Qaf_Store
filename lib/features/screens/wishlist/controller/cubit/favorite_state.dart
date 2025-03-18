import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = Initial;
  const factory FavoriteState.favoriteLoading() = FavoriteLoading;
  const factory FavoriteState.favoriteSuccess(List<ProductModel> favoriteProduct) = FavoriteSuccess;
  const factory FavoriteState.favoriteError(String error) = FavoriteError;

    const factory FavoriteState.favoriteProductChanged(String productId) =
      FavoriteProductChanged;
      const factory FavoriteState.favoriteProductRemoved(String productId) =
      FavoriteProductRemoved;
}
