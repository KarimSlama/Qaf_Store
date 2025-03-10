import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/home/data/repositories/banners_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/categories_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/products_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoriesRepository categoriesRepository;
  final BannersRepository bannersRepository;
  final ProductsRepository productsRepository;
  HomeCubit(this.categoriesRepository, this.bannersRepository,
      this.productsRepository)
      : super(HomeState.initial());

  List<CategoryModel> categoriesList = [];
  List<ProductModel> productList = [];
  var selectedOption = 'Name';
  Future<void> fetchAllCategories() async {
    try {
      emit(HomeState.categoryLoading());

      final categories = await categoriesRepository.fetchAllCategories();
      categories.when(
        success: (category) {
          categoriesList = category;
          emit(HomeState.categorySuccess(category));
        },
        failure: (error) {
          emit(HomeState.categoryError(error.toString()));
        },
      );
    } catch (error) {
      emit(HomeState.categoryError(error.toString()));
    }
  }

  Future<void> fetchAllBanners() async {
    try {
      emit(HomeState.bannersLoading());
      final banners = await bannersRepository.fetchAllBanners();
      banners.when(
        success: (banner) {
          emit(HomeState.bannersSuccess(banner));
        },
        failure: (error) {
          emit(HomeState.bannersError(error.toString()));
        },
      );
    } catch (error) {
      emit(HomeState.bannersError(error.toString()));
    }
  }

  Future<List<ProductModel>> fetchAllProduct() async {
    try {
      emit(HomeState.productsLoading());
      final result = await productsRepository.getAllProducts();
      return result.when(
        success: (data) {
          productList = data;
          emit(HomeState.productsSuccess(productList));
          return productList;
        },
        failure: (error) {
          emit(HomeState.productsError(error.toString()));
          return [];
        },
      );
    } catch (error) {
      emit(HomeState.productsError(error.toString()));
    }
    return productList;
  }

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      emit(HomeState.productsLoading());
      final productByQuery =
          await productsRepository.fetchProductByQuery(query);
      return productByQuery.when(
        success: (data) {
          emit(HomeState.productsSuccess(data));
          return data;
        },
        failure: (error) {
          emit(HomeState.productsError(error.toString()));
          return [];
        },
      );
    } catch (error) {
      emit(HomeState.productsError(error.toString()));
    }
    return productList;
  }

  void sortProducts(String sortOption) {
    emit(HomeState.productsLoading());
    selectedOption = sortOption;
    switch (sortOption) {
      case 'Name':
        productList.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        productList.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Lower Price':
        productList.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        productList.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        productList.sort((a, b) {
          if (b.salePrice > 0)
            return b.salePrice.compareTo(a.salePrice);
          else if (a.salePrice > 0)
            return -1;
          else
            return 1;
        });
        break;

      default:
        productList.sort((a, b) => a.title.compareTo(b.title));
    }
    emit(HomeState.productsSuccess(List.from(productList)));
  }

  void assignProducts(List<ProductModel> products) {
    productList = products;
    sortProducts('Name');
    emit(HomeState.productsSuccess(List.from(productList)));
  }
}
