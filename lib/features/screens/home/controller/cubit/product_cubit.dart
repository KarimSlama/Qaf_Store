import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  ProductCubit(
    this.categoriesRepository,
    this.bannersRepository,
    this.productsRepository,
  ) : super(const ProductState.initial());

  List<CategoryModel> categoriesList = [];
  var selectedOption = 'Name';

  List<String> tabsTitle = [
    'Sports',
    'Electronics',
    'Clothes',
    'Animals',
    'Furnitures',
    'Shoes',
    'Cosmetics'
  ];

  Future<void> fetchCategories() async {
    try {
      emit(const ProductState.categoryLoading());

      final categories = await categoriesRepository.fetchAllCategories();

      categories.when(
        success: (category) {
          categoriesList  =category;
          emit(ProductState.categorySuccess(category));
        },
        failure: (error) {
          emit(ProductState.categoryError(error.toString()));
        },
      );
    } catch (error) {
      emit(ProductState.categoryError(error.toString()));
    }
  }

  Future<void> fetchProductsForCategory({required String categoryId}) async {
    try {
      emit(const ProductState.categoryProductsLoading());

      final products = await productsRepository.fetchProductForCategory(
          categoryId: categoryId);
      products.when(
        success: (data) {
          emit(ProductState.categoryProductsSuccess(data));
        },
        failure: (error) {
          emit(ProductState.categoryProductsError(error.toString()));
        },
      );
    } catch (error) {
      emit(ProductState.categoryProductsError(error.toString()));
    }
  }

  Future<void> fetchAllBanners() async {
    try {
      emit(const ProductState.bannersLoading());

      final banners = await bannersRepository.fetchAllBanners();
      banners.when(
        success: (banner) {
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

  Future<void> fetchAllProducts({String? brandId}) async {
    try {
      emit(const ProductState.productsLoading());

      if (brandId != null) {
        final brandProducts =
            await productsRepository.getBrandProducts(brandId: brandId);
        brandProducts.when(
          success: (products) {
            emit(ProductState.productsSuccess(products));
          },
          failure: (error) {
            emit(ProductState.productsError(error.toString()));
          },
        );
      } else {
        final allProducts = await productsRepository.getAllProducts();
        allProducts.when(
          success: (products) {
            emit(ProductState.productsSuccess(products));
          },
          failure: (error) {
            emit(ProductState.productsError(error.toString()));
          },
        );
      }
    } catch (error) {
      emit(ProductState.productsError(error.toString()));
    }
  }

  Future<void> fetchProductByQuery(Query? query) async {
    final currentState = state;
    if (currentState is ProductsSuccess && currentState.products.isNotEmpty) {
      return;
    }
    try {
      emit(const ProductState.productsLoading());

      final productByQuery =
          await productsRepository.fetchProductByQuery(query);
      productByQuery.when(
        success: (data) {
          emit(ProductState.productsSuccess(data));
        },
        failure: (error) {
          emit(ProductState.productsError(error.toString()));
        },
      );
    } catch (error) {
      emit(ProductState.productsError(error.toString()));
    }
  }

  void sortProducts(String sortOption) {
    final currentState = state;
    if (currentState is! ProductsSuccess) return;

    List<ProductModel> sortedProducts = List.from(currentState.products);

    switch (sortOption) {
      case 'Name':
        sortedProducts.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        sortedProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        sortedProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        sortedProducts.sort((a, b) => b.date!.compareTo(a.date!));
        break;
      case 'Sale':
        sortedProducts.sort((a, b) {
          if (b.salePrice > 0) return b.salePrice.compareTo(a.salePrice);
          if (a.salePrice > 0) return -1;
          return 1;
        });
        break;
      default:
        sortedProducts.sort((a, b) => a.title.compareTo(b.title));
    }

    emit(ProductState.productsSuccess(sortedProducts));
  }
}
