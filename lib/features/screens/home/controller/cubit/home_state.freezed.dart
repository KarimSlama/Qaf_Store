// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
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
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
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
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
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
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CarouselChangedImplCopyWith<$Res> {
  factory _$$CarouselChangedImplCopyWith(_$CarouselChangedImpl value,
          $Res Function(_$CarouselChangedImpl) then) =
      __$$CarouselChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int carouselCurrentIndex});
}

/// @nodoc
class __$$CarouselChangedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$CarouselChangedImpl>
    implements _$$CarouselChangedImplCopyWith<$Res> {
  __$$CarouselChangedImplCopyWithImpl(
      _$CarouselChangedImpl _value, $Res Function(_$CarouselChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carouselCurrentIndex = null,
  }) {
    return _then(_$CarouselChangedImpl(
      null == carouselCurrentIndex
          ? _value.carouselCurrentIndex
          : carouselCurrentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CarouselChangedImpl implements CarouselChanged {
  const _$CarouselChangedImpl(this.carouselCurrentIndex);

  @override
  final int carouselCurrentIndex;

  @override
  String toString() {
    return 'HomeState.carouselChanged(carouselCurrentIndex: $carouselCurrentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarouselChangedImpl &&
            (identical(other.carouselCurrentIndex, carouselCurrentIndex) ||
                other.carouselCurrentIndex == carouselCurrentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, carouselCurrentIndex);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarouselChangedImplCopyWith<_$CarouselChangedImpl> get copyWith =>
      __$$CarouselChangedImplCopyWithImpl<_$CarouselChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return carouselChanged(carouselCurrentIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return carouselChanged?.call(carouselCurrentIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (carouselChanged != null) {
      return carouselChanged(carouselCurrentIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return carouselChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return carouselChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (carouselChanged != null) {
      return carouselChanged(this);
    }
    return orElse();
  }
}

abstract class CarouselChanged implements HomeState {
  const factory CarouselChanged(final int carouselCurrentIndex) =
      _$CarouselChangedImpl;

  int get carouselCurrentIndex;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarouselChangedImplCopyWith<_$CarouselChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryLoadingImplCopyWith<$Res> {
  factory _$$CategoryLoadingImplCopyWith(_$CategoryLoadingImpl value,
          $Res Function(_$CategoryLoadingImpl) then) =
      __$$CategoryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$CategoryLoadingImpl>
    implements _$$CategoryLoadingImplCopyWith<$Res> {
  __$$CategoryLoadingImplCopyWithImpl(
      _$CategoryLoadingImpl _value, $Res Function(_$CategoryLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CategoryLoadingImpl implements CategoryLoading {
  const _$CategoryLoadingImpl();

  @override
  String toString() {
    return 'HomeState.categoryLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return categoryLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return categoryLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (categoryLoading != null) {
      return categoryLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return categoryLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return categoryLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (categoryLoading != null) {
      return categoryLoading(this);
    }
    return orElse();
  }
}

abstract class CategoryLoading implements HomeState {
  const factory CategoryLoading() = _$CategoryLoadingImpl;
}

/// @nodoc
abstract class _$$CategorySuccessImplCopyWith<$Res> {
  factory _$$CategorySuccessImplCopyWith(_$CategorySuccessImpl value,
          $Res Function(_$CategorySuccessImpl) then) =
      __$$CategorySuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$CategorySuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$CategorySuccessImpl>
    implements _$$CategorySuccessImplCopyWith<$Res> {
  __$$CategorySuccessImplCopyWithImpl(
      _$CategorySuccessImpl _value, $Res Function(_$CategorySuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategorySuccessImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$CategorySuccessImpl implements CategorySuccess {
  const _$CategorySuccessImpl(final List<CategoryModel> categories)
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'HomeState.categorySuccess(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySuccessImplCopyWith<_$CategorySuccessImpl> get copyWith =>
      __$$CategorySuccessImplCopyWithImpl<_$CategorySuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return categorySuccess(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return categorySuccess?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (categorySuccess != null) {
      return categorySuccess(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return categorySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return categorySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (categorySuccess != null) {
      return categorySuccess(this);
    }
    return orElse();
  }
}

abstract class CategorySuccess implements HomeState {
  const factory CategorySuccess(final List<CategoryModel> categories) =
      _$CategorySuccessImpl;

  List<CategoryModel> get categories;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySuccessImplCopyWith<_$CategorySuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryErrorImplCopyWith<$Res> {
  factory _$$CategoryErrorImplCopyWith(
          _$CategoryErrorImpl value, $Res Function(_$CategoryErrorImpl) then) =
      __$$CategoryErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CategoryErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$CategoryErrorImpl>
    implements _$$CategoryErrorImplCopyWith<$Res> {
  __$$CategoryErrorImplCopyWithImpl(
      _$CategoryErrorImpl _value, $Res Function(_$CategoryErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CategoryErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryErrorImpl implements CategoryError {
  const _$CategoryErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'HomeState.categoryError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryErrorImplCopyWith<_$CategoryErrorImpl> get copyWith =>
      __$$CategoryErrorImplCopyWithImpl<_$CategoryErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return categoryError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return categoryError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (categoryError != null) {
      return categoryError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return categoryError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return categoryError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (categoryError != null) {
      return categoryError(this);
    }
    return orElse();
  }
}

abstract class CategoryError implements HomeState {
  const factory CategoryError(final String error) = _$CategoryErrorImpl;

  String get error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryErrorImplCopyWith<_$CategoryErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BannersLoadingImplCopyWith<$Res> {
  factory _$$BannersLoadingImplCopyWith(_$BannersLoadingImpl value,
          $Res Function(_$BannersLoadingImpl) then) =
      __$$BannersLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BannersLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$BannersLoadingImpl>
    implements _$$BannersLoadingImplCopyWith<$Res> {
  __$$BannersLoadingImplCopyWithImpl(
      _$BannersLoadingImpl _value, $Res Function(_$BannersLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BannersLoadingImpl implements BannersLoading {
  const _$BannersLoadingImpl();

  @override
  String toString() {
    return 'HomeState.bannersLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BannersLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return bannersLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return bannersLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (bannersLoading != null) {
      return bannersLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return bannersLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return bannersLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (bannersLoading != null) {
      return bannersLoading(this);
    }
    return orElse();
  }
}

abstract class BannersLoading implements HomeState {
  const factory BannersLoading() = _$BannersLoadingImpl;
}

/// @nodoc
abstract class _$$BannersSuccessImplCopyWith<$Res> {
  factory _$$BannersSuccessImplCopyWith(_$BannersSuccessImpl value,
          $Res Function(_$BannersSuccessImpl) then) =
      __$$BannersSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BannersModel> banners});
}

/// @nodoc
class __$$BannersSuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$BannersSuccessImpl>
    implements _$$BannersSuccessImplCopyWith<$Res> {
  __$$BannersSuccessImplCopyWithImpl(
      _$BannersSuccessImpl _value, $Res Function(_$BannersSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
  }) {
    return _then(_$BannersSuccessImpl(
      null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannersModel>,
    ));
  }
}

/// @nodoc

class _$BannersSuccessImpl implements BannersSuccess {
  const _$BannersSuccessImpl(final List<BannersModel> banners)
      : _banners = banners;

  final List<BannersModel> _banners;
  @override
  List<BannersModel> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  String toString() {
    return 'HomeState.bannersSuccess(banners: $banners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannersSuccessImpl &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_banners));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannersSuccessImplCopyWith<_$BannersSuccessImpl> get copyWith =>
      __$$BannersSuccessImplCopyWithImpl<_$BannersSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return bannersSuccess(banners);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return bannersSuccess?.call(banners);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (bannersSuccess != null) {
      return bannersSuccess(banners);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return bannersSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return bannersSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (bannersSuccess != null) {
      return bannersSuccess(this);
    }
    return orElse();
  }
}

abstract class BannersSuccess implements HomeState {
  const factory BannersSuccess(final List<BannersModel> banners) =
      _$BannersSuccessImpl;

  List<BannersModel> get banners;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannersSuccessImplCopyWith<_$BannersSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BannersErrorImplCopyWith<$Res> {
  factory _$$BannersErrorImplCopyWith(
          _$BannersErrorImpl value, $Res Function(_$BannersErrorImpl) then) =
      __$$BannersErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$BannersErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$BannersErrorImpl>
    implements _$$BannersErrorImplCopyWith<$Res> {
  __$$BannersErrorImplCopyWithImpl(
      _$BannersErrorImpl _value, $Res Function(_$BannersErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$BannersErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BannersErrorImpl implements BannersError {
  const _$BannersErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'HomeState.bannersError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannersErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannersErrorImplCopyWith<_$BannersErrorImpl> get copyWith =>
      __$$BannersErrorImplCopyWithImpl<_$BannersErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return bannersError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return bannersError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (bannersError != null) {
      return bannersError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return bannersError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return bannersError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (bannersError != null) {
      return bannersError(this);
    }
    return orElse();
  }
}

abstract class BannersError implements HomeState {
  const factory BannersError(final String error) = _$BannersErrorImpl;

  String get error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannersErrorImplCopyWith<_$BannersErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsLoadingImplCopyWith<$Res> {
  factory _$$ProductsLoadingImplCopyWith(_$ProductsLoadingImpl value,
          $Res Function(_$ProductsLoadingImpl) then) =
      __$$ProductsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductsLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ProductsLoadingImpl>
    implements _$$ProductsLoadingImplCopyWith<$Res> {
  __$$ProductsLoadingImplCopyWithImpl(
      _$ProductsLoadingImpl _value, $Res Function(_$ProductsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProductsLoadingImpl implements ProductsLoading {
  const _$ProductsLoadingImpl();

  @override
  String toString() {
    return 'HomeState.productsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProductsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return productsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return productsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (productsLoading != null) {
      return productsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return productsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return productsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (productsLoading != null) {
      return productsLoading(this);
    }
    return orElse();
  }
}

abstract class ProductsLoading implements HomeState {
  const factory ProductsLoading() = _$ProductsLoadingImpl;
}

/// @nodoc
abstract class _$$ProductsSuccessImplCopyWith<$Res> {
  factory _$$ProductsSuccessImplCopyWith(_$ProductsSuccessImpl value,
          $Res Function(_$ProductsSuccessImpl) then) =
      __$$ProductsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductModel> products});
}

/// @nodoc
class __$$ProductsSuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ProductsSuccessImpl>
    implements _$$ProductsSuccessImplCopyWith<$Res> {
  __$$ProductsSuccessImplCopyWithImpl(
      _$ProductsSuccessImpl _value, $Res Function(_$ProductsSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductsSuccessImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$ProductsSuccessImpl implements ProductsSuccess {
  const _$ProductsSuccessImpl(final List<ProductModel> products)
      : _products = products;

  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'HomeState.productsSuccess(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsSuccessImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsSuccessImplCopyWith<_$ProductsSuccessImpl> get copyWith =>
      __$$ProductsSuccessImplCopyWithImpl<_$ProductsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return productsSuccess(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return productsSuccess?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (productsSuccess != null) {
      return productsSuccess(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return productsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return productsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (productsSuccess != null) {
      return productsSuccess(this);
    }
    return orElse();
  }
}

abstract class ProductsSuccess implements HomeState {
  const factory ProductsSuccess(final List<ProductModel> products) =
      _$ProductsSuccessImpl;

  List<ProductModel> get products;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsSuccessImplCopyWith<_$ProductsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsErrorImplCopyWith<$Res> {
  factory _$$ProductsErrorImplCopyWith(
          _$ProductsErrorImpl value, $Res Function(_$ProductsErrorImpl) then) =
      __$$ProductsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ProductsErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ProductsErrorImpl>
    implements _$$ProductsErrorImplCopyWith<$Res> {
  __$$ProductsErrorImplCopyWithImpl(
      _$ProductsErrorImpl _value, $Res Function(_$ProductsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ProductsErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductsErrorImpl implements ProductsError {
  const _$ProductsErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'HomeState.productsError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsErrorImplCopyWith<_$ProductsErrorImpl> get copyWith =>
      __$$ProductsErrorImplCopyWithImpl<_$ProductsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int carouselCurrentIndex) carouselChanged,
    required TResult Function() categoryLoading,
    required TResult Function(List<CategoryModel> categories) categorySuccess,
    required TResult Function(String error) categoryError,
    required TResult Function() bannersLoading,
    required TResult Function(List<BannersModel> banners) bannersSuccess,
    required TResult Function(String error) bannersError,
    required TResult Function() productsLoading,
    required TResult Function(List<ProductModel> products) productsSuccess,
    required TResult Function(String error) productsError,
  }) {
    return productsError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int carouselCurrentIndex)? carouselChanged,
    TResult? Function()? categoryLoading,
    TResult? Function(List<CategoryModel> categories)? categorySuccess,
    TResult? Function(String error)? categoryError,
    TResult? Function()? bannersLoading,
    TResult? Function(List<BannersModel> banners)? bannersSuccess,
    TResult? Function(String error)? bannersError,
    TResult? Function()? productsLoading,
    TResult? Function(List<ProductModel> products)? productsSuccess,
    TResult? Function(String error)? productsError,
  }) {
    return productsError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int carouselCurrentIndex)? carouselChanged,
    TResult Function()? categoryLoading,
    TResult Function(List<CategoryModel> categories)? categorySuccess,
    TResult Function(String error)? categoryError,
    TResult Function()? bannersLoading,
    TResult Function(List<BannersModel> banners)? bannersSuccess,
    TResult Function(String error)? bannersError,
    TResult Function()? productsLoading,
    TResult Function(List<ProductModel> products)? productsSuccess,
    TResult Function(String error)? productsError,
    required TResult orElse(),
  }) {
    if (productsError != null) {
      return productsError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CarouselChanged value) carouselChanged,
    required TResult Function(CategoryLoading value) categoryLoading,
    required TResult Function(CategorySuccess value) categorySuccess,
    required TResult Function(CategoryError value) categoryError,
    required TResult Function(BannersLoading value) bannersLoading,
    required TResult Function(BannersSuccess value) bannersSuccess,
    required TResult Function(BannersError value) bannersError,
    required TResult Function(ProductsLoading value) productsLoading,
    required TResult Function(ProductsSuccess value) productsSuccess,
    required TResult Function(ProductsError value) productsError,
  }) {
    return productsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CarouselChanged value)? carouselChanged,
    TResult? Function(CategoryLoading value)? categoryLoading,
    TResult? Function(CategorySuccess value)? categorySuccess,
    TResult? Function(CategoryError value)? categoryError,
    TResult? Function(BannersLoading value)? bannersLoading,
    TResult? Function(BannersSuccess value)? bannersSuccess,
    TResult? Function(BannersError value)? bannersError,
    TResult? Function(ProductsLoading value)? productsLoading,
    TResult? Function(ProductsSuccess value)? productsSuccess,
    TResult? Function(ProductsError value)? productsError,
  }) {
    return productsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CarouselChanged value)? carouselChanged,
    TResult Function(CategoryLoading value)? categoryLoading,
    TResult Function(CategorySuccess value)? categorySuccess,
    TResult Function(CategoryError value)? categoryError,
    TResult Function(BannersLoading value)? bannersLoading,
    TResult Function(BannersSuccess value)? bannersSuccess,
    TResult Function(BannersError value)? bannersError,
    TResult Function(ProductsLoading value)? productsLoading,
    TResult Function(ProductsSuccess value)? productsSuccess,
    TResult Function(ProductsError value)? productsError,
    required TResult orElse(),
  }) {
    if (productsError != null) {
      return productsError(this);
    }
    return orElse();
  }
}

abstract class ProductsError implements HomeState {
  const factory ProductsError(final String error) = _$ProductsErrorImpl;

  String get error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsErrorImplCopyWith<_$ProductsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
