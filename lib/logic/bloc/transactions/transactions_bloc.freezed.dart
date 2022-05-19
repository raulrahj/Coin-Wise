// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllTransactions,
    required TResult Function(TransactionModel model) addTransaction,
    required TResult Function(String id, TransactionModel model)
        updateTransaction,
    required TResult Function(String keey) deleteTransaction,
    required TResult Function(String listType) separateTransactions,
    required TResult Function(bool isAdd, bool isIncome,
            List<CategoryModel> categories, String dropDownValue)
        transactionController,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllTransactions value) getAllTransactions,
    required TResult Function(AddTransaction value) addTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SeparateTransactions value) separateTransactions,
    required TResult Function(TransactionController value)
        transactionController,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsEventCopyWith<$Res> {
  factory $TransactionsEventCopyWith(
          TransactionsEvent value, $Res Function(TransactionsEvent) then) =
      _$TransactionsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionsEventCopyWithImpl<$Res>
    implements $TransactionsEventCopyWith<$Res> {
  _$TransactionsEventCopyWithImpl(this._value, this._then);

  final TransactionsEvent _value;
  // ignore: unused_field
  final $Res Function(TransactionsEvent) _then;
}

/// @nodoc
abstract class _$$GetAllTransactionsCopyWith<$Res> {
  factory _$$GetAllTransactionsCopyWith(_$GetAllTransactions value,
          $Res Function(_$GetAllTransactions) then) =
      __$$GetAllTransactionsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllTransactionsCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res>
    implements _$$GetAllTransactionsCopyWith<$Res> {
  __$$GetAllTransactionsCopyWithImpl(
      _$GetAllTransactions _value, $Res Function(_$GetAllTransactions) _then)
      : super(_value, (v) => _then(v as _$GetAllTransactions));

  @override
  _$GetAllTransactions get _value => super._value as _$GetAllTransactions;
}

/// @nodoc

class _$GetAllTransactions implements GetAllTransactions {
  const _$GetAllTransactions();

  @override
  String toString() {
    return 'TransactionsEvent.getAllTransactions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllTransactions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllTransactions,
    required TResult Function(TransactionModel model) addTransaction,
    required TResult Function(String id, TransactionModel model)
        updateTransaction,
    required TResult Function(String keey) deleteTransaction,
    required TResult Function(String listType) separateTransactions,
    required TResult Function(bool isAdd, bool isIncome,
            List<CategoryModel> categories, String dropDownValue)
        transactionController,
  }) {
    return getAllTransactions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
  }) {
    return getAllTransactions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
    required TResult orElse(),
  }) {
    if (getAllTransactions != null) {
      return getAllTransactions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllTransactions value) getAllTransactions,
    required TResult Function(AddTransaction value) addTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SeparateTransactions value) separateTransactions,
    required TResult Function(TransactionController value)
        transactionController,
  }) {
    return getAllTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
  }) {
    return getAllTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
    required TResult orElse(),
  }) {
    if (getAllTransactions != null) {
      return getAllTransactions(this);
    }
    return orElse();
  }
}

abstract class GetAllTransactions implements TransactionsEvent {
  const factory GetAllTransactions() = _$GetAllTransactions;
}

/// @nodoc
abstract class _$$AddTransactionCopyWith<$Res> {
  factory _$$AddTransactionCopyWith(
          _$AddTransaction value, $Res Function(_$AddTransaction) then) =
      __$$AddTransactionCopyWithImpl<$Res>;
  $Res call({TransactionModel model});
}

/// @nodoc
class __$$AddTransactionCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res>
    implements _$$AddTransactionCopyWith<$Res> {
  __$$AddTransactionCopyWithImpl(
      _$AddTransaction _value, $Res Function(_$AddTransaction) _then)
      : super(_value, (v) => _then(v as _$AddTransaction));

  @override
  _$AddTransaction get _value => super._value as _$AddTransaction;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$AddTransaction(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TransactionModel,
    ));
  }
}

/// @nodoc

class _$AddTransaction implements AddTransaction {
  const _$AddTransaction({required this.model});

  @override
  final TransactionModel model;

  @override
  String toString() {
    return 'TransactionsEvent.addTransaction(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTransaction &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$AddTransactionCopyWith<_$AddTransaction> get copyWith =>
      __$$AddTransactionCopyWithImpl<_$AddTransaction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllTransactions,
    required TResult Function(TransactionModel model) addTransaction,
    required TResult Function(String id, TransactionModel model)
        updateTransaction,
    required TResult Function(String keey) deleteTransaction,
    required TResult Function(String listType) separateTransactions,
    required TResult Function(bool isAdd, bool isIncome,
            List<CategoryModel> categories, String dropDownValue)
        transactionController,
  }) {
    return addTransaction(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
  }) {
    return addTransaction?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
    required TResult orElse(),
  }) {
    if (addTransaction != null) {
      return addTransaction(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllTransactions value) getAllTransactions,
    required TResult Function(AddTransaction value) addTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SeparateTransactions value) separateTransactions,
    required TResult Function(TransactionController value)
        transactionController,
  }) {
    return addTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
  }) {
    return addTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
    required TResult orElse(),
  }) {
    if (addTransaction != null) {
      return addTransaction(this);
    }
    return orElse();
  }
}

abstract class AddTransaction implements TransactionsEvent {
  const factory AddTransaction({required final TransactionModel model}) =
      _$AddTransaction;

  TransactionModel get model => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AddTransactionCopyWith<_$AddTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTransactionCopyWith<$Res> {
  factory _$$UpdateTransactionCopyWith(
          _$UpdateTransaction value, $Res Function(_$UpdateTransaction) then) =
      __$$UpdateTransactionCopyWithImpl<$Res>;
  $Res call({String id, TransactionModel model});
}

/// @nodoc
class __$$UpdateTransactionCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res>
    implements _$$UpdateTransactionCopyWith<$Res> {
  __$$UpdateTransactionCopyWithImpl(
      _$UpdateTransaction _value, $Res Function(_$UpdateTransaction) _then)
      : super(_value, (v) => _then(v as _$UpdateTransaction));

  @override
  _$UpdateTransaction get _value => super._value as _$UpdateTransaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? model = freezed,
  }) {
    return _then(_$UpdateTransaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TransactionModel,
    ));
  }
}

/// @nodoc

class _$UpdateTransaction implements UpdateTransaction {
  const _$UpdateTransaction({required this.id, required this.model});

  @override
  final String id;
  @override
  final TransactionModel model;

  @override
  String toString() {
    return 'TransactionsEvent.updateTransaction(id: $id, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$UpdateTransactionCopyWith<_$UpdateTransaction> get copyWith =>
      __$$UpdateTransactionCopyWithImpl<_$UpdateTransaction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllTransactions,
    required TResult Function(TransactionModel model) addTransaction,
    required TResult Function(String id, TransactionModel model)
        updateTransaction,
    required TResult Function(String keey) deleteTransaction,
    required TResult Function(String listType) separateTransactions,
    required TResult Function(bool isAdd, bool isIncome,
            List<CategoryModel> categories, String dropDownValue)
        transactionController,
  }) {
    return updateTransaction(id, model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
  }) {
    return updateTransaction?.call(id, model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
    required TResult orElse(),
  }) {
    if (updateTransaction != null) {
      return updateTransaction(id, model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllTransactions value) getAllTransactions,
    required TResult Function(AddTransaction value) addTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SeparateTransactions value) separateTransactions,
    required TResult Function(TransactionController value)
        transactionController,
  }) {
    return updateTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
  }) {
    return updateTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
    required TResult orElse(),
  }) {
    if (updateTransaction != null) {
      return updateTransaction(this);
    }
    return orElse();
  }
}

abstract class UpdateTransaction implements TransactionsEvent {
  const factory UpdateTransaction(
      {required final String id,
      required final TransactionModel model}) = _$UpdateTransaction;

  String get id => throw _privateConstructorUsedError;
  TransactionModel get model => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UpdateTransactionCopyWith<_$UpdateTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTransactionCopyWith<$Res> {
  factory _$$DeleteTransactionCopyWith(
          _$DeleteTransaction value, $Res Function(_$DeleteTransaction) then) =
      __$$DeleteTransactionCopyWithImpl<$Res>;
  $Res call({String keey});
}

/// @nodoc
class __$$DeleteTransactionCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res>
    implements _$$DeleteTransactionCopyWith<$Res> {
  __$$DeleteTransactionCopyWithImpl(
      _$DeleteTransaction _value, $Res Function(_$DeleteTransaction) _then)
      : super(_value, (v) => _then(v as _$DeleteTransaction));

  @override
  _$DeleteTransaction get _value => super._value as _$DeleteTransaction;

  @override
  $Res call({
    Object? keey = freezed,
  }) {
    return _then(_$DeleteTransaction(
      keey: keey == freezed
          ? _value.keey
          : keey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteTransaction implements DeleteTransaction {
  const _$DeleteTransaction({required this.keey});

  @override
  final String keey;

  @override
  String toString() {
    return 'TransactionsEvent.deleteTransaction(keey: $keey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTransaction &&
            const DeepCollectionEquality().equals(other.keey, keey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keey));

  @JsonKey(ignore: true)
  @override
  _$$DeleteTransactionCopyWith<_$DeleteTransaction> get copyWith =>
      __$$DeleteTransactionCopyWithImpl<_$DeleteTransaction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllTransactions,
    required TResult Function(TransactionModel model) addTransaction,
    required TResult Function(String id, TransactionModel model)
        updateTransaction,
    required TResult Function(String keey) deleteTransaction,
    required TResult Function(String listType) separateTransactions,
    required TResult Function(bool isAdd, bool isIncome,
            List<CategoryModel> categories, String dropDownValue)
        transactionController,
  }) {
    return deleteTransaction(keey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
  }) {
    return deleteTransaction?.call(keey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
    required TResult orElse(),
  }) {
    if (deleteTransaction != null) {
      return deleteTransaction(keey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllTransactions value) getAllTransactions,
    required TResult Function(AddTransaction value) addTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SeparateTransactions value) separateTransactions,
    required TResult Function(TransactionController value)
        transactionController,
  }) {
    return deleteTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
  }) {
    return deleteTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
    required TResult orElse(),
  }) {
    if (deleteTransaction != null) {
      return deleteTransaction(this);
    }
    return orElse();
  }
}

abstract class DeleteTransaction implements TransactionsEvent {
  const factory DeleteTransaction({required final String keey}) =
      _$DeleteTransaction;

  String get keey => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DeleteTransactionCopyWith<_$DeleteTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SeparateTransactionsCopyWith<$Res> {
  factory _$$SeparateTransactionsCopyWith(_$SeparateTransactions value,
          $Res Function(_$SeparateTransactions) then) =
      __$$SeparateTransactionsCopyWithImpl<$Res>;
  $Res call({String listType});
}

/// @nodoc
class __$$SeparateTransactionsCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res>
    implements _$$SeparateTransactionsCopyWith<$Res> {
  __$$SeparateTransactionsCopyWithImpl(_$SeparateTransactions _value,
      $Res Function(_$SeparateTransactions) _then)
      : super(_value, (v) => _then(v as _$SeparateTransactions));

  @override
  _$SeparateTransactions get _value => super._value as _$SeparateTransactions;

  @override
  $Res call({
    Object? listType = freezed,
  }) {
    return _then(_$SeparateTransactions(
      listType: listType == freezed
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SeparateTransactions implements SeparateTransactions {
  _$SeparateTransactions({required this.listType});

  @override
  final String listType;

  @override
  String toString() {
    return 'TransactionsEvent.separateTransactions(listType: $listType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeparateTransactions &&
            const DeepCollectionEquality().equals(other.listType, listType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(listType));

  @JsonKey(ignore: true)
  @override
  _$$SeparateTransactionsCopyWith<_$SeparateTransactions> get copyWith =>
      __$$SeparateTransactionsCopyWithImpl<_$SeparateTransactions>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllTransactions,
    required TResult Function(TransactionModel model) addTransaction,
    required TResult Function(String id, TransactionModel model)
        updateTransaction,
    required TResult Function(String keey) deleteTransaction,
    required TResult Function(String listType) separateTransactions,
    required TResult Function(bool isAdd, bool isIncome,
            List<CategoryModel> categories, String dropDownValue)
        transactionController,
  }) {
    return separateTransactions(listType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
  }) {
    return separateTransactions?.call(listType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
    required TResult orElse(),
  }) {
    if (separateTransactions != null) {
      return separateTransactions(listType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllTransactions value) getAllTransactions,
    required TResult Function(AddTransaction value) addTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SeparateTransactions value) separateTransactions,
    required TResult Function(TransactionController value)
        transactionController,
  }) {
    return separateTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
  }) {
    return separateTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
    required TResult orElse(),
  }) {
    if (separateTransactions != null) {
      return separateTransactions(this);
    }
    return orElse();
  }
}

abstract class SeparateTransactions implements TransactionsEvent {
  factory SeparateTransactions({required final String listType}) =
      _$SeparateTransactions;

  String get listType => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SeparateTransactionsCopyWith<_$SeparateTransactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionControllerCopyWith<$Res> {
  factory _$$TransactionControllerCopyWith(_$TransactionController value,
          $Res Function(_$TransactionController) then) =
      __$$TransactionControllerCopyWithImpl<$Res>;
  $Res call(
      {bool isAdd,
      bool isIncome,
      List<CategoryModel> categories,
      String dropDownValue});
}

/// @nodoc
class __$$TransactionControllerCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res>
    implements _$$TransactionControllerCopyWith<$Res> {
  __$$TransactionControllerCopyWithImpl(_$TransactionController _value,
      $Res Function(_$TransactionController) _then)
      : super(_value, (v) => _then(v as _$TransactionController));

  @override
  _$TransactionController get _value => super._value as _$TransactionController;

  @override
  $Res call({
    Object? isAdd = freezed,
    Object? isIncome = freezed,
    Object? categories = freezed,
    Object? dropDownValue = freezed,
  }) {
    return _then(_$TransactionController(
      isAdd: isAdd == freezed
          ? _value.isAdd
          : isAdd // ignore: cast_nullable_to_non_nullable
              as bool,
      isIncome: isIncome == freezed
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      dropDownValue: dropDownValue == freezed
          ? _value.dropDownValue
          : dropDownValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionController implements TransactionController {
  const _$TransactionController(
      {required this.isAdd,
      required this.isIncome,
      required final List<CategoryModel> categories,
      required this.dropDownValue})
      : _categories = categories;

  @override
  final bool isAdd;
  @override
  final bool isIncome;
  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String dropDownValue;

  @override
  String toString() {
    return 'TransactionsEvent.transactionController(isAdd: $isAdd, isIncome: $isIncome, categories: $categories, dropDownValue: $dropDownValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionController &&
            const DeepCollectionEquality().equals(other.isAdd, isAdd) &&
            const DeepCollectionEquality().equals(other.isIncome, isIncome) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other.dropDownValue, dropDownValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAdd),
      const DeepCollectionEquality().hash(isIncome),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(dropDownValue));

  @JsonKey(ignore: true)
  @override
  _$$TransactionControllerCopyWith<_$TransactionController> get copyWith =>
      __$$TransactionControllerCopyWithImpl<_$TransactionController>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllTransactions,
    required TResult Function(TransactionModel model) addTransaction,
    required TResult Function(String id, TransactionModel model)
        updateTransaction,
    required TResult Function(String keey) deleteTransaction,
    required TResult Function(String listType) separateTransactions,
    required TResult Function(bool isAdd, bool isIncome,
            List<CategoryModel> categories, String dropDownValue)
        transactionController,
  }) {
    return transactionController(isAdd, isIncome, categories, dropDownValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
  }) {
    return transactionController?.call(
        isAdd, isIncome, categories, dropDownValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllTransactions,
    TResult Function(TransactionModel model)? addTransaction,
    TResult Function(String id, TransactionModel model)? updateTransaction,
    TResult Function(String keey)? deleteTransaction,
    TResult Function(String listType)? separateTransactions,
    TResult Function(bool isAdd, bool isIncome, List<CategoryModel> categories,
            String dropDownValue)?
        transactionController,
    required TResult orElse(),
  }) {
    if (transactionController != null) {
      return transactionController(isAdd, isIncome, categories, dropDownValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllTransactions value) getAllTransactions,
    required TResult Function(AddTransaction value) addTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SeparateTransactions value) separateTransactions,
    required TResult Function(TransactionController value)
        transactionController,
  }) {
    return transactionController(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
  }) {
    return transactionController?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllTransactions value)? getAllTransactions,
    TResult Function(AddTransaction value)? addTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SeparateTransactions value)? separateTransactions,
    TResult Function(TransactionController value)? transactionController,
    required TResult orElse(),
  }) {
    if (transactionController != null) {
      return transactionController(this);
    }
    return orElse();
  }
}

abstract class TransactionController implements TransactionsEvent {
  const factory TransactionController(
      {required final bool isAdd,
      required final bool isIncome,
      required final List<CategoryModel> categories,
      required final String dropDownValue}) = _$TransactionController;

  bool get isAdd => throw _privateConstructorUsedError;
  bool get isIncome => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  String get dropDownValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TransactionControllerCopyWith<_$TransactionController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionsState {
  List<TransactionModel> get transactionList =>
      throw _privateConstructorUsedError;
  List<TransactionModel> get separateTransactionList =>
      throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  String get dropDownValue => throw _privateConstructorUsedError;
  bool get isAdd => throw _privateConstructorUsedError;
  bool get isIncome => throw _privateConstructorUsedError;
  double get incomeBal => throw _privateConstructorUsedError;
  double get expenseBal => throw _privateConstructorUsedError;
  double get totalBal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionsStateCopyWith<TransactionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(
          TransactionsState value, $Res Function(TransactionsState) then) =
      _$TransactionsStateCopyWithImpl<$Res>;
  $Res call(
      {List<TransactionModel> transactionList,
      List<TransactionModel> separateTransactionList,
      List<CategoryModel> categories,
      String dropDownValue,
      bool isAdd,
      bool isIncome,
      double incomeBal,
      double expenseBal,
      double totalBal});
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._value, this._then);

  final TransactionsState _value;
  // ignore: unused_field
  final $Res Function(TransactionsState) _then;

  @override
  $Res call({
    Object? transactionList = freezed,
    Object? separateTransactionList = freezed,
    Object? categories = freezed,
    Object? dropDownValue = freezed,
    Object? isAdd = freezed,
    Object? isIncome = freezed,
    Object? incomeBal = freezed,
    Object? expenseBal = freezed,
    Object? totalBal = freezed,
  }) {
    return _then(_value.copyWith(
      transactionList: transactionList == freezed
          ? _value.transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      separateTransactionList: separateTransactionList == freezed
          ? _value.separateTransactionList
          : separateTransactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      dropDownValue: dropDownValue == freezed
          ? _value.dropDownValue
          : dropDownValue // ignore: cast_nullable_to_non_nullable
              as String,
      isAdd: isAdd == freezed
          ? _value.isAdd
          : isAdd // ignore: cast_nullable_to_non_nullable
              as bool,
      isIncome: isIncome == freezed
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      incomeBal: incomeBal == freezed
          ? _value.incomeBal
          : incomeBal // ignore: cast_nullable_to_non_nullable
              as double,
      expenseBal: expenseBal == freezed
          ? _value.expenseBal
          : expenseBal // ignore: cast_nullable_to_non_nullable
              as double,
      totalBal: totalBal == freezed
          ? _value.totalBal
          : totalBal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_TransactionsStateCopyWith<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  factory _$$_TransactionsStateCopyWith(_$_TransactionsState value,
          $Res Function(_$_TransactionsState) then) =
      __$$_TransactionsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TransactionModel> transactionList,
      List<TransactionModel> separateTransactionList,
      List<CategoryModel> categories,
      String dropDownValue,
      bool isAdd,
      bool isIncome,
      double incomeBal,
      double expenseBal,
      double totalBal});
}

/// @nodoc
class __$$_TransactionsStateCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res>
    implements _$$_TransactionsStateCopyWith<$Res> {
  __$$_TransactionsStateCopyWithImpl(
      _$_TransactionsState _value, $Res Function(_$_TransactionsState) _then)
      : super(_value, (v) => _then(v as _$_TransactionsState));

  @override
  _$_TransactionsState get _value => super._value as _$_TransactionsState;

  @override
  $Res call({
    Object? transactionList = freezed,
    Object? separateTransactionList = freezed,
    Object? categories = freezed,
    Object? dropDownValue = freezed,
    Object? isAdd = freezed,
    Object? isIncome = freezed,
    Object? incomeBal = freezed,
    Object? expenseBal = freezed,
    Object? totalBal = freezed,
  }) {
    return _then(_$_TransactionsState(
      transactionList: transactionList == freezed
          ? _value._transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      separateTransactionList: separateTransactionList == freezed
          ? _value._separateTransactionList
          : separateTransactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      dropDownValue: dropDownValue == freezed
          ? _value.dropDownValue
          : dropDownValue // ignore: cast_nullable_to_non_nullable
              as String,
      isAdd: isAdd == freezed
          ? _value.isAdd
          : isAdd // ignore: cast_nullable_to_non_nullable
              as bool,
      isIncome: isIncome == freezed
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      incomeBal: incomeBal == freezed
          ? _value.incomeBal
          : incomeBal // ignore: cast_nullable_to_non_nullable
              as double,
      expenseBal: expenseBal == freezed
          ? _value.expenseBal
          : expenseBal // ignore: cast_nullable_to_non_nullable
              as double,
      totalBal: totalBal == freezed
          ? _value.totalBal
          : totalBal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_TransactionsState implements _TransactionsState {
  const _$_TransactionsState(
      {required final List<TransactionModel> transactionList,
      required final List<TransactionModel> separateTransactionList,
      required final List<CategoryModel> categories,
      required this.dropDownValue,
      required this.isAdd,
      required this.isIncome,
      required this.incomeBal,
      required this.expenseBal,
      required this.totalBal})
      : _transactionList = transactionList,
        _separateTransactionList = separateTransactionList,
        _categories = categories;

  final List<TransactionModel> _transactionList;
  @override
  List<TransactionModel> get transactionList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionList);
  }

  final List<TransactionModel> _separateTransactionList;
  @override
  List<TransactionModel> get separateTransactionList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_separateTransactionList);
  }

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String dropDownValue;
  @override
  final bool isAdd;
  @override
  final bool isIncome;
  @override
  final double incomeBal;
  @override
  final double expenseBal;
  @override
  final double totalBal;

  @override
  String toString() {
    return 'TransactionsState(transactionList: $transactionList, separateTransactionList: $separateTransactionList, categories: $categories, dropDownValue: $dropDownValue, isAdd: $isAdd, isIncome: $isIncome, incomeBal: $incomeBal, expenseBal: $expenseBal, totalBal: $totalBal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionsState &&
            const DeepCollectionEquality()
                .equals(other._transactionList, _transactionList) &&
            const DeepCollectionEquality().equals(
                other._separateTransactionList, _separateTransactionList) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other.dropDownValue, dropDownValue) &&
            const DeepCollectionEquality().equals(other.isAdd, isAdd) &&
            const DeepCollectionEquality().equals(other.isIncome, isIncome) &&
            const DeepCollectionEquality().equals(other.incomeBal, incomeBal) &&
            const DeepCollectionEquality()
                .equals(other.expenseBal, expenseBal) &&
            const DeepCollectionEquality().equals(other.totalBal, totalBal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionList),
      const DeepCollectionEquality().hash(_separateTransactionList),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(dropDownValue),
      const DeepCollectionEquality().hash(isAdd),
      const DeepCollectionEquality().hash(isIncome),
      const DeepCollectionEquality().hash(incomeBal),
      const DeepCollectionEquality().hash(expenseBal),
      const DeepCollectionEquality().hash(totalBal));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionsStateCopyWith<_$_TransactionsState> get copyWith =>
      __$$_TransactionsStateCopyWithImpl<_$_TransactionsState>(
          this, _$identity);
}

abstract class _TransactionsState implements TransactionsState {
  const factory _TransactionsState(
      {required final List<TransactionModel> transactionList,
      required final List<TransactionModel> separateTransactionList,
      required final List<CategoryModel> categories,
      required final String dropDownValue,
      required final bool isAdd,
      required final bool isIncome,
      required final double incomeBal,
      required final double expenseBal,
      required final double totalBal}) = _$_TransactionsState;

  @override
  List<TransactionModel> get transactionList =>
      throw _privateConstructorUsedError;
  @override
  List<TransactionModel> get separateTransactionList =>
      throw _privateConstructorUsedError;
  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  String get dropDownValue => throw _privateConstructorUsedError;
  @override
  bool get isAdd => throw _privateConstructorUsedError;
  @override
  bool get isIncome => throw _privateConstructorUsedError;
  @override
  double get incomeBal => throw _privateConstructorUsedError;
  @override
  double get expenseBal => throw _privateConstructorUsedError;
  @override
  double get totalBal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionsStateCopyWith<_$_TransactionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
