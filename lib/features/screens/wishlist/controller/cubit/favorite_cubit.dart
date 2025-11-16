import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/home/data/repositories/products_repository.dart';
import 'package:qaf_store/features/screens/wishlist/controller/cubit/favorite_state.dart';
import 'package:qaf_store/utils/local_storage/shared_preferences.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final ProductsRepository productsRepository;
  FavoriteCubit(this.productsRepository) : super(FavoriteState.initial()) {
    _initialize();
  }
  final favorites = <String, bool>{};

  Future<void> _initialize() async {
    await initFavorites();
    fetchFavoriteProducts();
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId, context) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();

      Loaders.successSnackBar(
          context: context,
          title: 'The item has been added to your wishlist successfully');
      emit(FavoriteState.favoriteProductChanged(productId));
    } else {
      favorites.remove(productId);
      saveFavoritesToStorage();

      Loaders.successSnackBar(
          context: context,
          title: 'The item has been removed from your wishlist successfully');
      emit(FavoriteState.favoriteProductRemoved(productId));
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    SharedPreference.setData('favorites', encodedFavorites);
  }

  Future<void> initFavorites() async {
    try {
      final json = await SharedPreference.getString('favorites');
      if (json != null && json.isNotEmpty) {
        final favoriteStored = jsonDecode(json) as Map<String, dynamic>;
        favorites.addAll(
            favoriteStored.map((key, value) => MapEntry(key, value as bool)));
      }
    } catch (e) {
      favorites.clear();
    }
  }

  Future<void> fetchFavoriteProducts() async {
    try {
      emit(FavoriteState.favoriteLoading());
      if (favorites.keys.isEmpty) {
        emit(FavoriteState.favoriteError('Favorites Keys are Empty'));
        return;
      }
      final result = await productsRepository
          .fetchFavoriteProducts(favorites.keys.toList());

      result.when(success: (data) {
        emit(FavoriteState.favoriteSuccess(data));
      }, failure: (error) {
        emit(FavoriteState.favoriteError(error.toString()));
      });
    } catch (error) {
      emit(FavoriteState.favoriteError(error.toString()));
    }
  }
}
