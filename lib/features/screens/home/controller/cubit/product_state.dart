import 'package:qaf_store/features/screens/home/data/models/banners_model.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';

sealed class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class InitialLoading extends ProductState {
  const InitialLoading();
}

class ProductDataState extends ProductState {
  final List<CategoryModel>? categories;
  final List<BannersModel>? banners;
  final List<ProductModel>? products;
  final List<ProductModel>? categoryProducts;

  final bool isCategoriesLoading;
  final bool isBannersLoading;
  final bool isProductsLoading;
  final bool isCategoryProductsLoading;

  final String? categoriesError;
  final String? bannersError;
  final String? productsError;
  final String? categoryProductsError;

  const ProductDataState({
    this.categories,
    this.banners,
    this.products,
    this.categoryProducts,
    this.isCategoriesLoading = false,
    this.isBannersLoading = false,
    this.isProductsLoading = false,
    this.isCategoryProductsLoading = false,
    this.categoriesError,
    this.bannersError,
    this.productsError,
    this.categoryProductsError,
  });

  ProductDataState copyWith({
    List<CategoryModel>? categories,
    List<BannersModel>? banners,
    List<ProductModel>? products,
    List<ProductModel>? categoryProducts,
    bool? isCategoriesLoading,
    bool? isBannersLoading,
    bool? isProductsLoading,
    bool? isCategoryProductsLoading,
    String? categoriesError,
    String? bannersError,
    String? productsError,
    String? categoryProductsError,
  }) {
    return ProductDataState(
      categories: categories ?? this.categories,
      banners: banners ?? this.banners,
      products: products ?? this.products,
      categoryProducts: categoryProducts ?? this.categoryProducts,
      isCategoriesLoading: isCategoriesLoading ?? this.isCategoriesLoading,
      isBannersLoading: isBannersLoading ?? this.isBannersLoading,
      isProductsLoading: isProductsLoading ?? this.isProductsLoading,
      isCategoryProductsLoading:
          isCategoryProductsLoading ?? this.isCategoryProductsLoading,
      categoriesError: categoriesError,
      bannersError: bannersError,
      productsError: productsError,
      categoryProductsError: categoryProductsError,
    );
  }
}
