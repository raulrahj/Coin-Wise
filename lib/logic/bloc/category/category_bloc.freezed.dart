// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllCategory,
    required TResult Function(CategoryModel model) addCategory,
    required TResult Function(CategoryModel model) updateCategory,
    required TResult Function(String keey) deleteCategory,
    required TResult Function() filterCategory,
    required TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)
        categoryAmounts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllCategory value) getAllCategory,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
    required TResult Function(FilterCategories value) filterCategory,
    required TResult Function(CategoryAmounts value) categoryAmounts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

  final CategoryEvent _value;
  // ignore: unused_field
  final $Res Function(CategoryEvent) _then;
}

/// @nodoc
abstract class _$$GetAllCategoryCopyWith<$Res> {
  factory _$$GetAllCategoryCopyWith(
          _$GetAllCategory value, $Res Function(_$GetAllCategory) then) =
      __$$GetAllCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllCategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements _$$GetAllCategoryCopyWith<$Res> {
  __$$GetAllCategoryCopyWithImpl(
      _$GetAllCategory _value, $Res Function(_$GetAllCategory) _then)
      : super(_value, (v) => _then(v as _$GetAllCategory));

  @override
  _$GetAllCategory get _value => super._value as _$GetAllCategory;
}

/// @nodoc

class _$GetAllCategory implements GetAllCategory {
  const _$GetAllCategory();

  @override
  String toString() {
    return 'CategoryEvent.getAllCategory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllCategory,
    required TResult Function(CategoryModel model) addCategory,
    required TResult Function(CategoryModel model) updateCategory,
    required TResult Function(String keey) deleteCategory,
    required TResult Function() filterCategory,
    required TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)
        categoryAmounts,
  }) {
    return getAllCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
  }) {
    return getAllCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
    required TResult orElse(),
  }) {
    if (getAllCategory != null) {
      return getAllCategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllCategory value) getAllCategory,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
    required TResult Function(FilterCategories value) filterCategory,
    required TResult Function(CategoryAmounts value) categoryAmounts,
  }) {
    return getAllCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
  }) {
    return getAllCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
    required TResult orElse(),
  }) {
    if (getAllCategory != null) {
      return getAllCategory(this);
    }
    return orElse();
  }
}

abstract class GetAllCategory implements CategoryEvent {
  const factory GetAllCategory() = _$GetAllCategory;
}

/// @nodoc
abstract class _$$AddCategoryCopyWith<$Res> {
  factory _$$AddCategoryCopyWith(
          _$AddCategory value, $Res Function(_$AddCategory) then) =
      __$$AddCategoryCopyWithImpl<$Res>;
  $Res call({CategoryModel model});
}

/// @nodoc
class __$$AddCategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements _$$AddCategoryCopyWith<$Res> {
  __$$AddCategoryCopyWithImpl(
      _$AddCategory _value, $Res Function(_$AddCategory) _then)
      : super(_value, (v) => _then(v as _$AddCategory));

  @override
  _$AddCategory get _value => super._value as _$AddCategory;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$AddCategory(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$AddCategory implements AddCategory {
  const _$AddCategory({required this.model});

  @override
  final CategoryModel model;

  @override
  String toString() {
    return 'CategoryEvent.addCategory(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCategory &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$AddCategoryCopyWith<_$AddCategory> get copyWith =>
      __$$AddCategoryCopyWithImpl<_$AddCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllCategory,
    required TResult Function(CategoryModel model) addCategory,
    required TResult Function(CategoryModel model) updateCategory,
    required TResult Function(String keey) deleteCategory,
    required TResult Function() filterCategory,
    required TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)
        categoryAmounts,
  }) {
    return addCategory(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
  }) {
    return addCategory?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
    required TResult orElse(),
  }) {
    if (addCategory != null) {
      return addCategory(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllCategory value) getAllCategory,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
    required TResult Function(FilterCategories value) filterCategory,
    required TResult Function(CategoryAmounts value) categoryAmounts,
  }) {
    return addCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
  }) {
    return addCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
    required TResult orElse(),
  }) {
    if (addCategory != null) {
      return addCategory(this);
    }
    return orElse();
  }
}

abstract class AddCategory implements CategoryEvent {
  const factory AddCategory({required final CategoryModel model}) =
      _$AddCategory;

  CategoryModel get model => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AddCategoryCopyWith<_$AddCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCategoryCopyWith<$Res> {
  factory _$$UpdateCategoryCopyWith(
          _$UpdateCategory value, $Res Function(_$UpdateCategory) then) =
      __$$UpdateCategoryCopyWithImpl<$Res>;
  $Res call({CategoryModel model});
}

/// @nodoc
class __$$UpdateCategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements _$$UpdateCategoryCopyWith<$Res> {
  __$$UpdateCategoryCopyWithImpl(
      _$UpdateCategory _value, $Res Function(_$UpdateCategory) _then)
      : super(_value, (v) => _then(v as _$UpdateCategory));

  @override
  _$UpdateCategory get _value => super._value as _$UpdateCategory;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$UpdateCategory(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$UpdateCategory implements UpdateCategory {
  const _$UpdateCategory({required this.model});

  @override
  final CategoryModel model;

  @override
  String toString() {
    return 'CategoryEvent.updateCategory(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCategory &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$UpdateCategoryCopyWith<_$UpdateCategory> get copyWith =>
      __$$UpdateCategoryCopyWithImpl<_$UpdateCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllCategory,
    required TResult Function(CategoryModel model) addCategory,
    required TResult Function(CategoryModel model) updateCategory,
    required TResult Function(String keey) deleteCategory,
    required TResult Function() filterCategory,
    required TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)
        categoryAmounts,
  }) {
    return updateCategory(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
  }) {
    return updateCategory?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
    required TResult orElse(),
  }) {
    if (updateCategory != null) {
      return updateCategory(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllCategory value) getAllCategory,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
    required TResult Function(FilterCategories value) filterCategory,
    required TResult Function(CategoryAmounts value) categoryAmounts,
  }) {
    return updateCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
  }) {
    return updateCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
    required TResult orElse(),
  }) {
    if (updateCategory != null) {
      return updateCategory(this);
    }
    return orElse();
  }
}

abstract class UpdateCategory implements CategoryEvent {
  const factory UpdateCategory({required final CategoryModel model}) =
      _$UpdateCategory;

  CategoryModel get model => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UpdateCategoryCopyWith<_$UpdateCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCategoryCopyWith<$Res> {
  factory _$$DeleteCategoryCopyWith(
          _$DeleteCategory value, $Res Function(_$DeleteCategory) then) =
      __$$DeleteCategoryCopyWithImpl<$Res>;
  $Res call({String keey});
}

/// @nodoc
class __$$DeleteCategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements _$$DeleteCategoryCopyWith<$Res> {
  __$$DeleteCategoryCopyWithImpl(
      _$DeleteCategory _value, $Res Function(_$DeleteCategory) _then)
      : super(_value, (v) => _then(v as _$DeleteCategory));

  @override
  _$DeleteCategory get _value => super._value as _$DeleteCategory;

  @override
  $Res call({
    Object? keey = freezed,
  }) {
    return _then(_$DeleteCategory(
      keey: keey == freezed
          ? _value.keey
          : keey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteCategory implements DeleteCategory {
  const _$DeleteCategory({required this.keey});

  @override
  final String keey;

  @override
  String toString() {
    return 'CategoryEvent.deleteCategory(keey: $keey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCategory &&
            const DeepCollectionEquality().equals(other.keey, keey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keey));

  @JsonKey(ignore: true)
  @override
  _$$DeleteCategoryCopyWith<_$DeleteCategory> get copyWith =>
      __$$DeleteCategoryCopyWithImpl<_$DeleteCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllCategory,
    required TResult Function(CategoryModel model) addCategory,
    required TResult Function(CategoryModel model) updateCategory,
    required TResult Function(String keey) deleteCategory,
    required TResult Function() filterCategory,
    required TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)
        categoryAmounts,
  }) {
    return deleteCategory(keey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
  }) {
    return deleteCategory?.call(keey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
    required TResult orElse(),
  }) {
    if (deleteCategory != null) {
      return deleteCategory(keey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllCategory value) getAllCategory,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
    required TResult Function(FilterCategories value) filterCategory,
    required TResult Function(CategoryAmounts value) categoryAmounts,
  }) {
    return deleteCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
  }) {
    return deleteCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
    required TResult orElse(),
  }) {
    if (deleteCategory != null) {
      return deleteCategory(this);
    }
    return orElse();
  }
}

abstract class DeleteCategory implements CategoryEvent {
  const factory DeleteCategory({required final String keey}) = _$DeleteCategory;

  String get keey => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DeleteCategoryCopyWith<_$DeleteCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterCategoriesCopyWith<$Res> {
  factory _$$FilterCategoriesCopyWith(
          _$FilterCategories value, $Res Function(_$FilterCategories) then) =
      __$$FilterCategoriesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterCategoriesCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements _$$FilterCategoriesCopyWith<$Res> {
  __$$FilterCategoriesCopyWithImpl(
      _$FilterCategories _value, $Res Function(_$FilterCategories) _then)
      : super(_value, (v) => _then(v as _$FilterCategories));

  @override
  _$FilterCategories get _value => super._value as _$FilterCategories;
}

/// @nodoc

class _$FilterCategories implements FilterCategories {
  const _$FilterCategories();

  @override
  String toString() {
    return 'CategoryEvent.filterCategory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllCategory,
    required TResult Function(CategoryModel model) addCategory,
    required TResult Function(CategoryModel model) updateCategory,
    required TResult Function(String keey) deleteCategory,
    required TResult Function() filterCategory,
    required TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)
        categoryAmounts,
  }) {
    return filterCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
  }) {
    return filterCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
    required TResult orElse(),
  }) {
    if (filterCategory != null) {
      return filterCategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllCategory value) getAllCategory,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
    required TResult Function(FilterCategories value) filterCategory,
    required TResult Function(CategoryAmounts value) categoryAmounts,
  }) {
    return filterCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
  }) {
    return filterCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
    required TResult orElse(),
  }) {
    if (filterCategory != null) {
      return filterCategory(this);
    }
    return orElse();
  }
}

abstract class FilterCategories implements CategoryEvent {
  const factory FilterCategories() = _$FilterCategories;
}

/// @nodoc
abstract class _$$CategoryAmountsCopyWith<$Res> {
  factory _$$CategoryAmountsCopyWith(
          _$CategoryAmounts value, $Res Function(_$CategoryAmounts) then) =
      __$$CategoryAmountsCopyWithImpl<$Res>;
  $Res call(
      {List<CategoryModel> incomeCategories,
      List<CategoryModel> expenseCategories});
}

/// @nodoc
class __$$CategoryAmountsCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements _$$CategoryAmountsCopyWith<$Res> {
  __$$CategoryAmountsCopyWithImpl(
      _$CategoryAmounts _value, $Res Function(_$CategoryAmounts) _then)
      : super(_value, (v) => _then(v as _$CategoryAmounts));

  @override
  _$CategoryAmounts get _value => super._value as _$CategoryAmounts;

  @override
  $Res call({
    Object? incomeCategories = freezed,
    Object? expenseCategories = freezed,
  }) {
    return _then(_$CategoryAmounts(
      incomeCategories: incomeCategories == freezed
          ? _value._incomeCategories
          : incomeCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      expenseCategories: expenseCategories == freezed
          ? _value._expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$CategoryAmounts implements CategoryAmounts {
  const _$CategoryAmounts(
      {required final List<CategoryModel> incomeCategories,
      required final List<CategoryModel> expenseCategories})
      : _incomeCategories = incomeCategories,
        _expenseCategories = expenseCategories;

  final List<CategoryModel> _incomeCategories;
  @override
  List<CategoryModel> get incomeCategories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeCategories);
  }

  final List<CategoryModel> _expenseCategories;
  @override
  List<CategoryModel> get expenseCategories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseCategories);
  }

  @override
  String toString() {
    return 'CategoryEvent.categoryAmounts(incomeCategories: $incomeCategories, expenseCategories: $expenseCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryAmounts &&
            const DeepCollectionEquality()
                .equals(other._incomeCategories, _incomeCategories) &&
            const DeepCollectionEquality()
                .equals(other._expenseCategories, _expenseCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_incomeCategories),
      const DeepCollectionEquality().hash(_expenseCategories));

  @JsonKey(ignore: true)
  @override
  _$$CategoryAmountsCopyWith<_$CategoryAmounts> get copyWith =>
      __$$CategoryAmountsCopyWithImpl<_$CategoryAmounts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllCategory,
    required TResult Function(CategoryModel model) addCategory,
    required TResult Function(CategoryModel model) updateCategory,
    required TResult Function(String keey) deleteCategory,
    required TResult Function() filterCategory,
    required TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)
        categoryAmounts,
  }) {
    return categoryAmounts(incomeCategories, expenseCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
  }) {
    return categoryAmounts?.call(incomeCategories, expenseCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllCategory,
    TResult Function(CategoryModel model)? addCategory,
    TResult Function(CategoryModel model)? updateCategory,
    TResult Function(String keey)? deleteCategory,
    TResult Function()? filterCategory,
    TResult Function(List<CategoryModel> incomeCategories,
            List<CategoryModel> expenseCategories)?
        categoryAmounts,
    required TResult orElse(),
  }) {
    if (categoryAmounts != null) {
      return categoryAmounts(incomeCategories, expenseCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllCategory value) getAllCategory,
    required TResult Function(AddCategory value) addCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
    required TResult Function(FilterCategories value) filterCategory,
    required TResult Function(CategoryAmounts value) categoryAmounts,
  }) {
    return categoryAmounts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
  }) {
    return categoryAmounts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllCategory value)? getAllCategory,
    TResult Function(AddCategory value)? addCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    TResult Function(FilterCategories value)? filterCategory,
    TResult Function(CategoryAmounts value)? categoryAmounts,
    required TResult orElse(),
  }) {
    if (categoryAmounts != null) {
      return categoryAmounts(this);
    }
    return orElse();
  }
}

abstract class CategoryAmounts implements CategoryEvent {
  const factory CategoryAmounts(
          {required final List<CategoryModel> incomeCategories,
          required final List<CategoryModel> expenseCategories}) =
      _$CategoryAmounts;

  List<CategoryModel> get incomeCategories =>
      throw _privateConstructorUsedError;
  List<CategoryModel> get expenseCategories =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$CategoryAmountsCopyWith<_$CategoryAmounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryState {
  List<CategoryModel> get categoryList => throw _privateConstructorUsedError;
  List<CategoryModel> get incomeCategoryList =>
      throw _privateConstructorUsedError;
  List<CategoryModel> get expenseCategoryList =>
      throw _privateConstructorUsedError;
  List<CategoryModel> get incomeCategoryAmount =>
      throw _privateConstructorUsedError;
  List<CategoryModel> get expenseCategoryAmout =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res>;
  $Res call(
      {List<CategoryModel> categoryList,
      List<CategoryModel> incomeCategoryList,
      List<CategoryModel> expenseCategoryList,
      List<CategoryModel> incomeCategoryAmount,
      List<CategoryModel> expenseCategoryAmout});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  final CategoryState _value;
  // ignore: unused_field
  final $Res Function(CategoryState) _then;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? incomeCategoryList = freezed,
    Object? expenseCategoryList = freezed,
    Object? incomeCategoryAmount = freezed,
    Object? expenseCategoryAmout = freezed,
  }) {
    return _then(_value.copyWith(
      categoryList: categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      incomeCategoryList: incomeCategoryList == freezed
          ? _value.incomeCategoryList
          : incomeCategoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      expenseCategoryList: expenseCategoryList == freezed
          ? _value.expenseCategoryList
          : expenseCategoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      incomeCategoryAmount: incomeCategoryAmount == freezed
          ? _value.incomeCategoryAmount
          : incomeCategoryAmount // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      expenseCategoryAmout: expenseCategoryAmout == freezed
          ? _value.expenseCategoryAmout
          : expenseCategoryAmout // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoryStateCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$$_CategoryStateCopyWith(
          _$_CategoryState value, $Res Function(_$_CategoryState) then) =
      __$$_CategoryStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryModel> categoryList,
      List<CategoryModel> incomeCategoryList,
      List<CategoryModel> expenseCategoryList,
      List<CategoryModel> incomeCategoryAmount,
      List<CategoryModel> expenseCategoryAmout});
}

/// @nodoc
class __$$_CategoryStateCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements _$$_CategoryStateCopyWith<$Res> {
  __$$_CategoryStateCopyWithImpl(
      _$_CategoryState _value, $Res Function(_$_CategoryState) _then)
      : super(_value, (v) => _then(v as _$_CategoryState));

  @override
  _$_CategoryState get _value => super._value as _$_CategoryState;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? incomeCategoryList = freezed,
    Object? expenseCategoryList = freezed,
    Object? incomeCategoryAmount = freezed,
    Object? expenseCategoryAmout = freezed,
  }) {
    return _then(_$_CategoryState(
      categoryList: categoryList == freezed
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      incomeCategoryList: incomeCategoryList == freezed
          ? _value._incomeCategoryList
          : incomeCategoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      expenseCategoryList: expenseCategoryList == freezed
          ? _value._expenseCategoryList
          : expenseCategoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      incomeCategoryAmount: incomeCategoryAmount == freezed
          ? _value._incomeCategoryAmount
          : incomeCategoryAmount // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      expenseCategoryAmout: expenseCategoryAmout == freezed
          ? _value._expenseCategoryAmout
          : expenseCategoryAmout // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$_CategoryState implements _CategoryState {
  const _$_CategoryState(
      {required final List<CategoryModel> categoryList,
      required final List<CategoryModel> incomeCategoryList,
      required final List<CategoryModel> expenseCategoryList,
      required final List<CategoryModel> incomeCategoryAmount,
      required final List<CategoryModel> expenseCategoryAmout})
      : _categoryList = categoryList,
        _incomeCategoryList = incomeCategoryList,
        _expenseCategoryList = expenseCategoryList,
        _incomeCategoryAmount = incomeCategoryAmount,
        _expenseCategoryAmout = expenseCategoryAmout;

  final List<CategoryModel> _categoryList;
  @override
  List<CategoryModel> get categoryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  final List<CategoryModel> _incomeCategoryList;
  @override
  List<CategoryModel> get incomeCategoryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeCategoryList);
  }

  final List<CategoryModel> _expenseCategoryList;
  @override
  List<CategoryModel> get expenseCategoryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseCategoryList);
  }

  final List<CategoryModel> _incomeCategoryAmount;
  @override
  List<CategoryModel> get incomeCategoryAmount {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeCategoryAmount);
  }

  final List<CategoryModel> _expenseCategoryAmout;
  @override
  List<CategoryModel> get expenseCategoryAmout {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseCategoryAmout);
  }

  @override
  String toString() {
    return 'CategoryState(categoryList: $categoryList, incomeCategoryList: $incomeCategoryList, expenseCategoryList: $expenseCategoryList, incomeCategoryAmount: $incomeCategoryAmount, expenseCategoryAmout: $expenseCategoryAmout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryState &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality()
                .equals(other._incomeCategoryList, _incomeCategoryList) &&
            const DeepCollectionEquality()
                .equals(other._expenseCategoryList, _expenseCategoryList) &&
            const DeepCollectionEquality()
                .equals(other._incomeCategoryAmount, _incomeCategoryAmount) &&
            const DeepCollectionEquality()
                .equals(other._expenseCategoryAmout, _expenseCategoryAmout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_incomeCategoryList),
      const DeepCollectionEquality().hash(_expenseCategoryList),
      const DeepCollectionEquality().hash(_incomeCategoryAmount),
      const DeepCollectionEquality().hash(_expenseCategoryAmout));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryStateCopyWith<_$_CategoryState> get copyWith =>
      __$$_CategoryStateCopyWithImpl<_$_CategoryState>(this, _$identity);
}

abstract class _CategoryState implements CategoryState {
  const factory _CategoryState(
          {required final List<CategoryModel> categoryList,
          required final List<CategoryModel> incomeCategoryList,
          required final List<CategoryModel> expenseCategoryList,
          required final List<CategoryModel> incomeCategoryAmount,
          required final List<CategoryModel> expenseCategoryAmout}) =
      _$_CategoryState;

  @override
  List<CategoryModel> get categoryList => throw _privateConstructorUsedError;
  @override
  List<CategoryModel> get incomeCategoryList =>
      throw _privateConstructorUsedError;
  @override
  List<CategoryModel> get expenseCategoryList =>
      throw _privateConstructorUsedError;
  @override
  List<CategoryModel> get incomeCategoryAmount =>
      throw _privateConstructorUsedError;
  @override
  List<CategoryModel> get expenseCategoryAmout =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryStateCopyWith<_$_CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
