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
import 'package:qaf_store/utils/local_storage/shared_preferences.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadCartItems();
  }

  void resetSelectedAttributes() {
    emit(state.copyWith(
      selectedAttributes: {},
      variationStockStatus: '',
      productVariationModel: ProductVariationModel.empty(),
    ));
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final variation = state.productVariationModel;
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

  void addToCart(ProductModel product, BuildContext context) {
    if (state.productQuantityInCart < 1) {
      Loaders.qafToast(message: 'Select Quantity');
      return;
    }

    final isSingle = product.productType == ProductType.single.toString() ||
        product.productType?.toLowerCase() == 'single';
    final isVariable = product.productType == ProductType.variable.toString() ||
        product.productType?.toLowerCase() == 'variable';

    if (isSingle) {
      final currentState = state;
      final updatedState = currentState.copyWith(
        selectedAttributes: {},
        variationStockStatus: '',
        productVariationModel: ProductVariationModel.empty(),
      );
      emit(updatedState);

      final selectedCartItem =
          convertToCartItem(product, updatedState.productQuantityInCart);
      final index = updatedState.cartItems.indexWhere((cartItem) =>
          cartItem.productId == selectedCartItem.productId &&
          cartItem.variationId == selectedCartItem.variationId);

      final newCartItems = List<CartItemModel>.from(updatedState.cartItems);

      if (index >= 0) {
        newCartItems[index] = selectedCartItem;
      } else {
        newCartItems.add(selectedCartItem);
      }

      emit(updatedState.copyWith(cartItems: newCartItems));
      updateCart();
      Loaders.qafToast(message: 'Your Product has been added to the Cart');
      return;
    }

    if (isVariable) {
      if (state.productVariationModel.id.isEmpty) {
        Loaders.qafToast(message: 'Select Variation');
        return;
      }

      if (state.productVariationModel.stock < 1) {
        Loaders.warningSnackBar(
          context: context,
          title: QafStrings.ohSnap,
          message: 'Selected Variation is out of Stock',
        );
        return;
      }
    } else {
      if (product.stock < 1) {
        Loaders.warningSnackBar(
          context: context,
          title: QafStrings.ohSnap,
          message: 'Product is out of Stock',
        );
        return;
      }
    }

    final selectedCartItem =
        convertToCartItem(product, state.productQuantityInCart);

    final index = state.cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    final newCartItems = List<CartItemModel>.from(state.cartItems);

    if (index >= 0) {
      newCartItems[index] = selectedCartItem;
    } else {
      newCartItems.add(selectedCartItem);
    }

    emit(state.copyWith(cartItems: newCartItems));
    updateCart();
    Loaders.qafToast(message: 'Your Product has been added to the Cart');
  }

  void addOneToCart(CartItemModel item) {
    final index = state.cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    final newCartItems = List<CartItemModel>.from(state.cartItems);

    if (index >= 0) {
      newCartItems[index] = newCartItems[index].copyWith(
        quantity: newCartItems[index].quantity + 1,
      );
    } else {
      newCartItems.add(item);
    }

    emit(state.copyWith(cartItems: newCartItems));
    updateCart();
  }

  void removeOneFromCart(CartItemModel item, BuildContext context) {
    final index = state.cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      final newCartItems = List<CartItemModel>.from(state.cartItems);

      if (newCartItems[index].quantity > 1) {
        newCartItems[index] = newCartItems[index].copyWith(
          quantity: newCartItems[index].quantity - 1,
        );
        emit(state.copyWith(cartItems: newCartItems));
        updateCart();
      } else {
        removeFromCartDialog(index, context);
      }
    }
  }

  void updateProductQuantity(int newQuantity) {
    emit(state.copyWith(productQuantityInCart: newQuantity));
  }

  void removeFromCartDialog(int index, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remove Product"),
          content: const Text("Are you sure you wanna remove this product?"),
          actions: [
            TextButton(
              child: const Text("Confirm"),
              onPressed: () {
                final newCartItems = List<CartItemModel>.from(state.cartItems);
                newCartItems.removeAt(index);
                emit(state.copyWith(cartItems: newCartItems));
                updateCart();
                Loaders.qafToast(message: 'Product removed from the Cart');
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
  }

  void updateCartTotals() {
    double calculateTotalPrice = 0.0;
    int calculateNoOfItem = 0;

    for (var item in state.cartItems) {
      calculateTotalPrice += item.price * item.quantity.toDouble();
      calculateNoOfItem += item.quantity;
    }

    emit(state.copyWith(
      totalCartPrice: calculateTotalPrice,
      noOfCartItems: calculateNoOfItem,
    ));
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      emit(state.copyWith(
        productQuantityInCart: getProductQuantityInCart(product.id),
      ));
    } else {
      final variationId = state.productVariationModel.id;
      if (variationId.isNotEmpty) {
        emit(state.copyWith(
          productQuantityInCart:
              getVariationQuantityInCart(product.id, variationId),
        ));
      } else {
        emit(state.copyWith(productQuantityInCart: 0));
      }
    }
  }

  void saveCartItems() {
    final cartItemStrings =
        state.cartItems.map((item) => item.toJson()).toList();
    final encodedData = jsonEncode(cartItemStrings);
    SharedPreference.setData('CART', encodedData);
  }

  Future<void> loadCartItems() async {
    final cartItemSaved = await SharedPreference.getString('CART');

    if (cartItemSaved != null && cartItemSaved.isNotEmpty) {
      final List<dynamic> decodedData = jsonDecode(cartItemSaved);
      final cartItems =
          decodedData.map((item) => CartItemModel.fromJson(item)).toList();

      emit(state.copyWith(cartItems: cartItems));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    return state.cartItems
        .where((item) => item.productId == productId)
        .fold(0, (sum, item) => sum + item.quantity);
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final existingItem = state.cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return existingItem.quantity;
  }

  void clearCart() {
    emit(CartState.initial());
    saveCartItems();
  }

  void updateSelectedAttributes(Map<String, dynamic> attributes) {
    emit(state.copyWith(selectedAttributes: attributes));
  }

  void updateVariationStockStatus(String status) {
    emit(state.copyWith(variationStockStatus: status));
  }

  void updateProductVariation(ProductVariationModel variation) {
    emit(state.copyWith(productVariationModel: variation));
  }
}
