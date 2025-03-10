import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_variation_model.dart';
import 'package:qaf_store/features/screens/product_details/controller/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsState.initial());

  String selectedProductImage = '';
  Map selectedAttributes = {};
  String variationStockStatus = '';
  ProductVariationModel productVariationModel = ProductVariationModel.empty();

  List<String> getAllProductsImages(ProductModel product) {
    emit(ProductDetailsState.loading());

    Set<String> images = {product.thumbnail};

    if (product.images != null) images.addAll(product.images!);
    if (product.productVariation != null &&
        product.productVariation!.isNotEmpty) {
      images.addAll(
          product.productVariation!.map((variation) => variation.image));
    }

    selectedProductImage = product.thumbnail;
    emit(ProductDetailsState.success(selectedProductImage));
    return images.toList();
  }

  String updateSelectedImage(String imageUrl) {
    selectedProductImage = imageUrl;
    emit(ProductDetailsState.success(selectedProductImage));
    return selectedProductImage;
  }

  void onAttributeSelected(
      ProductModel product, String attributeName, String attributeValue) {
    final updatedAttributes = Map<String, dynamic>.from(selectedAttributes);
    updatedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariation!.firstWhere(
      (variation) =>
          _isSameAttributesValue(variation.attributeValues, updatedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    final newImage = selectedVariation.image.isNotEmpty
        ? selectedVariation.image
        : product.thumbnail;

    productVariationModel = selectedVariation;
    selectedAttributes = updatedAttributes;
    selectedProductImage = newImage;
    getProductStockStatus();

    emit(ProductDetailsState.success(selectedProductImage));
  }

  bool _isSameAttributesValue(Map<String, dynamic> variationAttribute,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttribute.length != selectedAttributes.length) return false;

    for (final key in variationAttribute.keys) {
      if (variationAttribute[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (productVariationModel.salePrice > 0
            ? productVariationModel.salePrice
            : productVariationModel.price)
        .toString();
  }

  void getProductStockStatus() {
    variationStockStatus =
        productVariationModel.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    productVariationModel = ProductVariationModel.empty();
  }
}
