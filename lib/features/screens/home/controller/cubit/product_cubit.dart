import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/home/data/models/banners_model.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/home/data/repositories/banners_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/categories_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/products_repository.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final CategoriesRepository categoriesRepository;
  final BannersRepository bannersRepository;
  final ProductsRepository productsRepository;
  ProductCubit(this.categoriesRepository, this.bannersRepository,
      this.productsRepository)
      : super(ProductState.initial());

  List<CategoryModel> categoriesList = [];
  List<BannersModel> bannersList = [];
  List<ProductModel> productList = [];

  List<String> tabsTitle = [
    'Sports',
    'Electronics',
    'Clothes',
    'Animals',
    'Furnitures',
    'Shoes',
    'Cosmetics'
  ];
  var selectedOption = 'Name';

  Future<void> fetchAllCategories() async {
    try {
      emit(ProductState.categoryLoading());

      final categories = await categoriesRepository.fetchAllCategories();
      categories.when(
        success: (category) {
          categoriesList = category;
          emit(ProductState.categorySuccess(categoriesList));
        },
        failure: (error) {
          emit(ProductState.categoryError(error.toString()));
        },
      );
    } catch (error) {
      emit(ProductState.categoryError(error.toString()));
    }
  }

  Future<void> fetchSubCategories(String categoryId) async {
    try {
      emit(ProductState.categoryLoading());

      final categories =
          await categoriesRepository.fetchSubCategories(categoryId);
      categories.when(
        success: (category) {
          categoriesList = category;
          emit(ProductState.categorySuccess(categoriesList));
        },
        failure: (error) {
          emit(ProductState.categoryError(error.toString()));
        },
      );
    } catch (error) {
      emit(ProductState.categoryError(error.toString()));
    }
  }

  Future<void> fetchAllBanners() async {
    try {
      emit(ProductState.bannersLoading());
      final banners = await bannersRepository.fetchAllBanners();
      banners.when(
        success: (banner) {
          bannersList = banner;
          emit(ProductState.bannersSuccess(banner));
        },
        failure: (error) {
          emit(ProductState.bannersError(error.toString()));
        },
      );
    } catch (error) {
      emit(ProductState.bannersError(error.toString()));
    }
  }

  Future<List<ProductModel>> fetchAllProduct() async {
    try {
      emit(ProductState.productsLoading());
      final result = await productsRepository.getAllProducts();
      return result.when(
        success: (data) {
          productList = data;
          emit(ProductState.productsSuccess(productList));
          return productList;
        },
        failure: (error) {
          emit(ProductState.productsError(error.toString()));
          return [];
        },
      );
    } catch (error) {
      emit(ProductState.productsError(error.toString()));
    }
    return productList;
  }

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      emit(ProductState.productsLoading());
      final productByQuery =
          await productsRepository.fetchProductByQuery(query);
      return productByQuery.when(
        success: (data) {
          emit(ProductState.productsSuccess(data));
          return data;
        },
        failure: (error) {
          emit(ProductState.productsError(error.toString()));
          return [];
        },
      );
    } catch (error) {
      emit(ProductState.productsError(error.toString()));
    }
    return productList;
  }

  Future<void> fetchProductForCategory(String categoryId) async {
    try {
      emit(ProductState.categoryProductsLoading());
      final productForCategory = await productsRepository
          .fetchProductForCategory(categoryId: categoryId);
      productForCategory.when(
        success: (data) {
          productList = data;
          emit(ProductState.categoryProductsSuccess(data));
          return data;
        },
        failure: (error) {
          emit(ProductState.categoryProductsError(error.toString()));
          return [];
        },
      );
    } catch (error) {
      emit(ProductState.categoryProductsError(error.toString()));
    }
  }

  Future<void> getProductsByBrand({required String brandId}) async {
    try {
      emit(ProductState.productsLoading());
      final products =
          await productsRepository.getBrandProducts(brandId: brandId);
      products.when(
        success: (products) {
          productList = products;
          emit(ProductState.productsSuccess(products));
        },
        failure: (error) {
          emit(ProductState.productsError(error));
        },
      );
    } catch (error) {
      emit(ProductState.productsError(error.toString()));
    }
  }

  void sortProducts(String sortOption) {
    emit(ProductState.productsLoading());
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
    emit(ProductState.productsSuccess(List.from(productList)));
  }

  void assignProducts(List<ProductModel> products) {
    productList = products;
    sortProducts('Name');
    emit(ProductState.productsSuccess(List.from(productList)));
  }
}
