import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/home/data/repositories/banners_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/categories_repository.dart';
import 'package:qaf_store/features/screens/home/data/repositories/products_repository.dart';
import 'package:qaf_store/utils/constants/enum.dart';
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
  Future<void> fetchAllCategories() async {
    try {
      emit(HomeState.categoryLoading());
      print('loading');
      final categories = await categoriesRepository.fetchAllCategories();
      categories.when(
        success: (category) {
          categoriesList = category;
          print('the category is ${category[0].name}');
          emit(HomeState.categorySuccess(category));
        },
        failure: (error) {
          print('the error with failure all categories cateched is $error');
          emit(HomeState.categoryError(error.toString()));
        },
      );
    } catch (error) {
      print('the error with fetch all categories cateched is $error');
      emit(HomeState.categoryError(error.toString()));
    }
  }

  Future<void> fetchAllBanners() async {
    try {
      emit(HomeState.bannersLoading());
      print('banners loading');
      final banners = await bannersRepository.fetchAllBanners();
      banners.when(
        success: (banner) {
          print('the banner is $banner');
          emit(HomeState.bannersSuccess(banner));
        },
        failure: (error) {
          print('the error with failure all banners cateched is $error');
          emit(HomeState.bannersError(error.toString()));
        },
      );
    } catch (error) {
      print('the error with fetch all banners cateched is $error');
      emit(HomeState.bannersError(error.toString()));
    }
  }

  Future<void> fetchAllProducts() async {
    try {
      emit(HomeState.productsLoading());
      final result = await productsRepository.getAllProducts();
      result.when(
        success: (data) {
          productList = data;
          print('the length of products list with cubit is ${productList.length}');
          emit(HomeState.productsSuccess(data));
        },
        failure: (error) {
          print('the error with fetch products cubit is $error');
          emit(HomeState.productsError(error.toString()));
        },
      );
    } catch (error) {
      print('the error with fetch all products cateched is $error');
      emit(HomeState.productsError(error.toString()));
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variant in product.productVariation!) {
        double priceToConsider =
            variant.salePrice > 0.0 ? variant.salePrice : variant.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice == largestPrice) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculateSalePrecentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double precentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return precentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void updateCarouselIndex(int newIndex) {
    emit(HomeState.carouselChanged(newIndex));
  }
}
