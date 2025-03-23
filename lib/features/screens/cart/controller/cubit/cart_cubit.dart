import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_state.dart';
import 'package:qaf_store/features/screens/cart/data/model/cart_item_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_variation_model.dart';
import 'package:qaf_store/utils/constants/enum.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/local_storage/shared_preferences.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadCartItems();
  }

  int noOfCartItems = 0;
  double totalCartPrice = 0.0;
  int productQuantityInCart = 0;
  List<CartItemModel> cartItem = [];
  Map selectedAttributes = {};
  String variationStockStatus = '';
  ProductVariationModel productVariationModel = ProductVariationModel.empty();

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus = '';
    productVariationModel = ProductVariationModel.empty();
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString())
      resetSelectedAttributes();

    final variation = productVariationModel;
    final isVariant = variation.id.isNotEmpty;

    final price = isVariant
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      brandName: product.brand != null ? product.brand!.name : '',
      image: isVariant ? variation.image : product.thumbnail,
      price: price,
      title: product.title,
      variationId: variation.id,
      selectedVariation: isVariant ? variation.attributeValues : null,
    );
  }

  void addToCart(ProductModel product, context) {
    if (productQuantityInCart < 1) {
      Loaders.qafToast(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        productVariationModel.id.isEmpty) {
      Loaders.qafToast(message: 'Select Variation');
      return;
    }

    if (product.productType == ProductType.variable.toString()) {
      if (productVariationModel.stock < 1) {
        Loaders.warningSnackBar(
            context: context,
            title: QafStrings.ohSnap,
            message: 'Selected Variation is out of Stock');
        return;
      }
    } else {
      if (product.stock < 1) {
        Loaders.warningSnackBar(
            context: context,
            title: QafStrings.ohSnap,
            message: 'Selected Variation is out of Stock');
        return;
      }
    }

    final selectedCartItem = convertToCartItem(product, productQuantityInCart);

    int index = cartItem.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0)
      cartItem[index].quantity = selectedCartItem.quantity;
    else {
      cartItem = List.from(cartItem)..add(selectedCartItem);
    }

    emit(CartState.cartUpdated(List.from(cartItem)));
    updateCart();
    Loaders.qafToast(message: 'Your Product has been added to the Cart');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItem.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItem[index] = cartItem[index].copyWith(
        quantity: cartItem[index].quantity + 1,
      );
    } else {
      cartItem = List.from(cartItem)..add(item);
    }

    updateCart();
    emit(CartState.cartUpdated(List.from(cartItem)));
  }

  void removeOneFromCart(CartItemModel item, context) {
    int index = cartItem.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItem[index].quantity > 1) {
        cartItem[index] = cartItem[index].copyWith(
          quantity: cartItem[index].quantity - 1,
        );
      } else {
        cartItem[index].quantity == 1
            ? removeFromCartDialog(index, context)
            : cartItem.removeAt(index);
      }
      updateCart();
      emit(CartState.cartUpdated(List.from(cartItem)));
    }
  }

  void updateProductQuantity(int newQuantity) {
    productQuantityInCart = newQuantity;
    emit(CartState.cartUpdated(List.from(cartItem)));
  }

  void removeFromCartDialog(index, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Remove Product"),
          content: Text("Are you sure you wanna remove this product ?"),
          actions: [
            TextButton(
              child: Text("Confirm"),
              onPressed: () {
                cartItem.removeAt(index);
                updateCart();
                Loaders.qafToast(message: 'Product removed from the Cart');
                context.pop();
              },
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  updateCart() {
    updateCartTotals();
    saveCartItems();
    emit(CartState.cartUpdated(List.from(cartItem)));
  }

  void updateCartTotals() {
    double calculateTotalPrice = 0.0;
    int calculateNoOfItem = 0;

    for (var item in cartItem) {
      calculateTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNoOfItem += item.quantity;
    }

    totalCartPrice = calculateTotalPrice;
    noOfCartItems = calculateNoOfItem;
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString())
      productQuantityInCart = getProductQuantityInCart(product.id);
    else {
      final variationId = productVariationModel.id;
      if (variationId.isEmpty)
        productQuantityInCart =
            getVariationQuantityInCart(product.id, variationId);
      else
        productQuantityInCart = 0;
    }
  }

  void saveCartItems() {
    final cartItemStrings = cartItem.map((item) => item.toJson()).toList();
    final encodedData = jsonEncode(cartItemStrings);
    SharedPreference.setData('CART', encodedData);
  }

  Future<void> loadCartItems() async {
    final cartItemSaved = await SharedPreference.getString('CART');

    if (cartItemSaved != null && cartItemSaved.isNotEmpty) {
      final List<dynamic> decodedData = jsonDecode(cartItemSaved);
      cartItem =
          decodedData.map((item) => CartItemModel.fromJson(item)).toList();

      updateCartTotals();
      emit(CartState.cartLoaded(cartItem));
    }
  }

  int getProductQuantityInCart(String productId) {
    final existingItem = cartItem
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return existingItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final existingItem = cartItem.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return existingItem.quantity;
  }

  void clearCart() {
    productQuantityInCart = 0;
    cartItem.clear();
    updateCart();
    emit(CartState.cartUpdated(List.from(cartItem)));
  }
}
