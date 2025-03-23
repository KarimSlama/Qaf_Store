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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CartItemModel> cartItem) cartUpdated,
    required TResult Function(List<CartItemModel> cartItem) cartLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult? Function(List<CartItemModel> cartItem)? cartLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult Function(List<CartItemModel> cartItem)? cartLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CartUpdated value) cartUpdated,
    required TResult Function(CartLoaded value) cartLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CartUpdated value)? cartUpdated,
    TResult? Function(CartLoaded value)? cartLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CartUpdated value)? cartUpdated,
    TResult Function(CartLoaded value)? cartLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
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
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CartState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CartItemModel> cartItem) cartUpdated,
    required TResult Function(List<CartItemModel> cartItem) cartLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult? Function(List<CartItemModel> cartItem)? cartLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult Function(List<CartItemModel> cartItem)? cartLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CartUpdated value) cartUpdated,
    required TResult Function(CartLoaded value) cartLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CartUpdated value)? cartUpdated,
    TResult? Function(CartLoaded value)? cartLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CartUpdated value)? cartUpdated,
    TResult Function(CartLoaded value)? cartLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CartState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CartItemModel> cartItem) cartUpdated,
    required TResult Function(List<CartItemModel> cartItem) cartLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult? Function(List<CartItemModel> cartItem)? cartLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult Function(List<CartItemModel> cartItem)? cartLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CartUpdated value) cartUpdated,
    required TResult Function(CartLoaded value) cartLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CartUpdated value)? cartUpdated,
    TResult? Function(CartLoaded value)? cartLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CartUpdated value)? cartUpdated,
    TResult Function(CartLoaded value)? cartLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CartState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$CartUpdatedImplCopyWith<$Res> {
  factory _$$CartUpdatedImplCopyWith(
          _$CartUpdatedImpl value, $Res Function(_$CartUpdatedImpl) then) =
      __$$CartUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CartItemModel> cartItem});
}

/// @nodoc
class __$$CartUpdatedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartUpdatedImpl>
    implements _$$CartUpdatedImplCopyWith<$Res> {
  __$$CartUpdatedImplCopyWithImpl(
      _$CartUpdatedImpl _value, $Res Function(_$CartUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
  }) {
    return _then(_$CartUpdatedImpl(
      null == cartItem
          ? _value._cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
    ));
  }
}

/// @nodoc

class _$CartUpdatedImpl implements CartUpdated {
  const _$CartUpdatedImpl(final List<CartItemModel> cartItem)
      : _cartItem = cartItem;

  final List<CartItemModel> _cartItem;
  @override
  List<CartItemModel> get cartItem {
    if (_cartItem is EqualUnmodifiableListView) return _cartItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItem);
  }

  @override
  String toString() {
    return 'CartState.cartUpdated(cartItem: $cartItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartUpdatedImpl &&
            const DeepCollectionEquality().equals(other._cartItem, _cartItem));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cartItem));

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartUpdatedImplCopyWith<_$CartUpdatedImpl> get copyWith =>
      __$$CartUpdatedImplCopyWithImpl<_$CartUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CartItemModel> cartItem) cartUpdated,
    required TResult Function(List<CartItemModel> cartItem) cartLoaded,
  }) {
    return cartUpdated(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult? Function(List<CartItemModel> cartItem)? cartLoaded,
  }) {
    return cartUpdated?.call(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult Function(List<CartItemModel> cartItem)? cartLoaded,
    required TResult orElse(),
  }) {
    if (cartUpdated != null) {
      return cartUpdated(cartItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CartUpdated value) cartUpdated,
    required TResult Function(CartLoaded value) cartLoaded,
  }) {
    return cartUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CartUpdated value)? cartUpdated,
    TResult? Function(CartLoaded value)? cartLoaded,
  }) {
    return cartUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CartUpdated value)? cartUpdated,
    TResult Function(CartLoaded value)? cartLoaded,
    required TResult orElse(),
  }) {
    if (cartUpdated != null) {
      return cartUpdated(this);
    }
    return orElse();
  }
}

abstract class CartUpdated implements CartState {
  const factory CartUpdated(final List<CartItemModel> cartItem) =
      _$CartUpdatedImpl;

  List<CartItemModel> get cartItem;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartUpdatedImplCopyWith<_$CartUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartLoadedImplCopyWith<$Res> {
  factory _$$CartLoadedImplCopyWith(
          _$CartLoadedImpl value, $Res Function(_$CartLoadedImpl) then) =
      __$$CartLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CartItemModel> cartItem});
}

/// @nodoc
class __$$CartLoadedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartLoadedImpl>
    implements _$$CartLoadedImplCopyWith<$Res> {
  __$$CartLoadedImplCopyWithImpl(
      _$CartLoadedImpl _value, $Res Function(_$CartLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
  }) {
    return _then(_$CartLoadedImpl(
      null == cartItem
          ? _value._cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
    ));
  }
}

/// @nodoc

class _$CartLoadedImpl implements CartLoaded {
  const _$CartLoadedImpl(final List<CartItemModel> cartItem)
      : _cartItem = cartItem;

  final List<CartItemModel> _cartItem;
  @override
  List<CartItemModel> get cartItem {
    if (_cartItem is EqualUnmodifiableListView) return _cartItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItem);
  }

  @override
  String toString() {
    return 'CartState.cartLoaded(cartItem: $cartItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartLoadedImpl &&
            const DeepCollectionEquality().equals(other._cartItem, _cartItem));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cartItem));

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartLoadedImplCopyWith<_$CartLoadedImpl> get copyWith =>
      __$$CartLoadedImplCopyWithImpl<_$CartLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CartItemModel> cartItem) cartUpdated,
    required TResult Function(List<CartItemModel> cartItem) cartLoaded,
  }) {
    return cartLoaded(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult? Function(List<CartItemModel> cartItem)? cartLoaded,
  }) {
    return cartLoaded?.call(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItemModel> cartItem)? cartUpdated,
    TResult Function(List<CartItemModel> cartItem)? cartLoaded,
    required TResult orElse(),
  }) {
    if (cartLoaded != null) {
      return cartLoaded(cartItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CartUpdated value) cartUpdated,
    required TResult Function(CartLoaded value) cartLoaded,
  }) {
    return cartLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CartUpdated value)? cartUpdated,
    TResult? Function(CartLoaded value)? cartLoaded,
  }) {
    return cartLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CartUpdated value)? cartUpdated,
    TResult Function(CartLoaded value)? cartLoaded,
    required TResult orElse(),
  }) {
    if (cartLoaded != null) {
      return cartLoaded(this);
    }
    return orElse();
  }
}

abstract class CartLoaded implements CartState {
  const factory CartLoaded(final List<CartItemModel> cartItem) =
      _$CartLoadedImpl;

  List<CartItemModel> get cartItem;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartLoadedImplCopyWith<_$CartLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
