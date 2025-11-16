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
  ) : super(const ProductDataState());

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

  ProductDataState get _currentState {
    final current = state;
    if (current is ProductDataState) return current;
    return const ProductDataState();
  }

  Future<void> fetchCategories() async {
    if (_currentState.categories != null &&
        _currentState.categories!.isNotEmpty) {
      return;
    }

    emit(_currentState.copyWith(isCategoriesLoading: true));

    final categories = await categoriesRepository.fetchAllCategories();

    categories.when(
      success: (category) {
        categoriesList = category;
        emit(_currentState.copyWith(
          categories: category,
          isCategoriesLoading: false,
        ));
      },
      failure: (error) {
        emit(_currentState.copyWith(
          isCategoriesLoading: false,
          categoriesError: error.toString(),
        ));
      },
    );
  }

  Future<void> fetchAllBanners() async {
    if (_currentState.banners != null && _currentState.banners!.isNotEmpty) {
      return;
    }

    emit(_currentState.copyWith(isBannersLoading: true));

    final banners = await bannersRepository.fetchAllBanners();
    banners.when(
      success: (banner) {
        emit(_currentState.copyWith(
          banners: banner,
          isBannersLoading: false,
        ));
      },
      failure: (error) {
        emit(_currentState.copyWith(
          isBannersLoading: false,
          bannersError: error.toString(),
        ));
      },
    );
  }

  Future<void> fetchAllProducts({String? brandId}) async {
    if (brandId == null &&
        _currentState.products != null &&
        _currentState.products!.isNotEmpty) {
      return;
    }

    emit(_currentState.copyWith(isProductsLoading: true));

    final result = brandId != null
        ? await productsRepository.getBrandProducts(brandId: brandId)
        : await productsRepository.getAllProducts();

    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(_currentState.copyWith(
            isProductsLoading: false,
            productsError: 'لا توجد منتجات',
          ));
        } else {
          emit(_currentState.copyWith(
            products: products,
            isProductsLoading: false,
          ));
        }
      },
      failure: (error) {
        print('❌ Error fetching products: $error');
        emit(_currentState.copyWith(
          isProductsLoading: false,
          productsError: error,
        ));
      },
    );
  }

  Future<void> fetchProductsForCategory({required String categoryId}) async {
    emit(_currentState.copyWith(isCategoryProductsLoading: true));

    final products = await productsRepository.fetchProductForCategory(
        categoryId: categoryId);
    products.when(
      success: (products) {
        emit(_currentState.copyWith(
          categoryProducts: products,
          isCategoryProductsLoading: false,
        ));
      },
      failure: (error) {
        emit(_currentState.copyWith(
          isCategoryProductsLoading: false,
          categoryProductsError: error.toString(),
        ));
      },
    );
  }

  Future<void> fetchProductByQuery(Query? query) async {
    if (_currentState.products != null && _currentState.products!.isNotEmpty) {
      return;
    }

    emit(_currentState.copyWith(isProductsLoading: true));

    final productByQuery = await productsRepository.fetchProductByQuery(query);
    productByQuery.when(
      success: (data) {
        emit(_currentState.copyWith(
          products: data,
          isProductsLoading: false,
        ));
      },
      failure: (error) {
        emit(_currentState.copyWith(
          isProductsLoading: false,
          productsError: error.toString(),
        ));
      },
    );
  }

  void sortProducts(String sortOption) {
    if (_currentState.products == null) return;

    List<ProductModel> sortedProducts = List.from(_currentState.products!);

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

    emit(_currentState.copyWith(products: sortedProducts));
  }
}
