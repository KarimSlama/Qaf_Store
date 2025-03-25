// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  List<CartItemModel> get cartItems => throw _privateConstructorUsedError;
  int get noOfCartItems => throw _privateConstructorUsedError;
  double get totalCartPrice => throw _privateConstructorUsedError;
  int get productQuantityInCart => throw _privateConstructorUsedError;
  Map<String, dynamic> get selectedAttributes =>
      throw _privateConstructorUsedError;
  String get variationStockStatus => throw _privateConstructorUsedError;
  ProductVariationModel get productVariationModel =>
      throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {List<CartItemModel> cartItems,
      int noOfCartItems,
      double totalCartPrice,
      int productQuantityInCart,
      Map<String, dynamic> selectedAttributes,
      String variationStockStatus,
      ProductVariationModel productVariationModel});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? noOfCartItems = null,
    Object? totalCartPrice = null,
    Object? productQuantityInCart = null,
    Object? selectedAttributes = null,
    Object? variationStockStatus = null,
    Object? productVariationModel = null,
  }) {
    return _then(_value.copyWith(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
      noOfCartItems: null == noOfCartItems
          ? _value.noOfCartItems
          : noOfCartItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalCartPrice: null == totalCartPrice
          ? _value.totalCartPrice
          : totalCartPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productQuantityInCart: null == productQuantityInCart
          ? _value.productQuantityInCart
          : productQuantityInCart // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAttributes: null == selectedAttributes
          ? _value.selectedAttributes
          : selectedAttributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      variationStockStatus: null == variationStockStatus
          ? _value.variationStockStatus
          : variationStockStatus // ignore: cast_nullable_to_non_nullable
              as String,
      productVariationModel: null == productVariationModel
          ? _value.productVariationModel
          : productVariationModel // ignore: cast_nullable_to_non_nullable
              as ProductVariationModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartItemModel> cartItems,
      int noOfCartItems,
      double totalCartPrice,
      int productQuantityInCart,
      Map<String, dynamic> selectedAttributes,
      String variationStockStatus,
      ProductVariationModel productVariationModel});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? noOfCartItems = null,
    Object? totalCartPrice = null,
    Object? productQuantityInCart = null,
    Object? selectedAttributes = null,
    Object? variationStockStatus = null,
    Object? productVariationModel = null,
  }) {
    return _then(_$CartStateImpl(
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
      noOfCartItems: null == noOfCartItems
          ? _value.noOfCartItems
          : noOfCartItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalCartPrice: null == totalCartPrice
          ? _value.totalCartPrice
          : totalCartPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productQuantityInCart: null == productQuantityInCart
          ? _value.productQuantityInCart
          : productQuantityInCart // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAttributes: null == selectedAttributes
          ? _value._selectedAttributes
          : selectedAttributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      variationStockStatus: null == variationStockStatus
          ? _value.variationStockStatus
          : variationStockStatus // ignore: cast_nullable_to_non_nullable
              as String,
      productVariationModel: null == productVariationModel
          ? _value.productVariationModel
          : productVariationModel // ignore: cast_nullable_to_non_nullable
              as ProductVariationModel,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {required final List<CartItemModel> cartItems,
      required this.noOfCartItems,
      required this.totalCartPrice,
      required this.productQuantityInCart,
      required final Map<String, dynamic> selectedAttributes,
      required this.variationStockStatus,
      required this.productVariationModel})
      : _cartItems = cartItems,
        _selectedAttributes = selectedAttributes;

  final List<CartItemModel> _cartItems;
  @override
  List<CartItemModel> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final int noOfCartItems;
  @override
  final double totalCartPrice;
  @override
  final int productQuantityInCart;
  final Map<String, dynamic> _selectedAttributes;
  @override
  Map<String, dynamic> get selectedAttributes {
    if (_selectedAttributes is EqualUnmodifiableMapView)
      return _selectedAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedAttributes);
  }

  @override
  final String variationStockStatus;
  @override
  final ProductVariationModel productVariationModel;

  @override
  String toString() {
    return 'CartState(cartItems: $cartItems, noOfCartItems: $noOfCartItems, totalCartPrice: $totalCartPrice, productQuantityInCart: $productQuantityInCart, selectedAttributes: $selectedAttributes, variationStockStatus: $variationStockStatus, productVariationModel: $productVariationModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.noOfCartItems, noOfCartItems) ||
                other.noOfCartItems == noOfCartItems) &&
            (identical(other.totalCartPrice, totalCartPrice) ||
                other.totalCartPrice == totalCartPrice) &&
            (identical(other.productQuantityInCart, productQuantityInCart) ||
                other.productQuantityInCart == productQuantityInCart) &&
            const DeepCollectionEquality()
                .equals(other._selectedAttributes, _selectedAttributes) &&
            (identical(other.variationStockStatus, variationStockStatus) ||
                other.variationStockStatus == variationStockStatus) &&
            (identical(other.productVariationModel, productVariationModel) ||
                other.productVariationModel == productVariationModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItems),
      noOfCartItems,
      totalCartPrice,
      productQuantityInCart,
      const DeepCollectionEquality().hash(_selectedAttributes),
      variationStockStatus,
      productVariationModel);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
          {required final List<CartItemModel> cartItems,
          required final int noOfCartItems,
          required final double totalCartPrice,
          required final int productQuantityInCart,
          required final Map<String, dynamic> selectedAttributes,
          required final String variationStockStatus,
          required final ProductVariationModel productVariationModel}) =
      _$CartStateImpl;

  @override
  List<CartItemModel> get cartItems;
  @override
  int get noOfCartItems;
  @override
  double get totalCartPrice;
  @override
  int get productQuantityInCart;
  @override
  Map<String, dynamic> get selectedAttributes;
  @override
  String get variationStockStatus;
  @override
  ProductVariationModel get productVariationModel;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
