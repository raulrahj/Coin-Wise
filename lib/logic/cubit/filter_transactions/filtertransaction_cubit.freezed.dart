// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filtertransaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FiltertransactionState {
  List<TransactionModel> get filterList => throw _privateConstructorUsedError;
  bool get isFilter => throw _privateConstructorUsedError;
  String get fitlerDropdownValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FiltertransactionStateCopyWith<FiltertransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltertransactionStateCopyWith<$Res> {
  factory $FiltertransactionStateCopyWith(FiltertransactionState value,
          $Res Function(FiltertransactionState) then) =
      _$FiltertransactionStateCopyWithImpl<$Res>;
  $Res call(
      {List<TransactionModel> filterList,
      bool isFilter,
      String fitlerDropdownValue});
}

/// @nodoc
class _$FiltertransactionStateCopyWithImpl<$Res>
    implements $FiltertransactionStateCopyWith<$Res> {
  _$FiltertransactionStateCopyWithImpl(this._value, this._then);

  final FiltertransactionState _value;
  // ignore: unused_field
  final $Res Function(FiltertransactionState) _then;

  @override
  $Res call({
    Object? filterList = freezed,
    Object? isFilter = freezed,
    Object? fitlerDropdownValue = freezed,
  }) {
    return _then(_value.copyWith(
      filterList: filterList == freezed
          ? _value.filterList
          : filterList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      isFilter: isFilter == freezed
          ? _value.isFilter
          : isFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      fitlerDropdownValue: fitlerDropdownValue == freezed
          ? _value.fitlerDropdownValue
          : fitlerDropdownValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FilterTransactionStateCopyWith<$Res>
    implements $FiltertransactionStateCopyWith<$Res> {
  factory _$$_FilterTransactionStateCopyWith(_$_FilterTransactionState value,
          $Res Function(_$_FilterTransactionState) then) =
      __$$_FilterTransactionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TransactionModel> filterList,
      bool isFilter,
      String fitlerDropdownValue});
}

/// @nodoc
class __$$_FilterTransactionStateCopyWithImpl<$Res>
    extends _$FiltertransactionStateCopyWithImpl<$Res>
    implements _$$_FilterTransactionStateCopyWith<$Res> {
  __$$_FilterTransactionStateCopyWithImpl(_$_FilterTransactionState _value,
      $Res Function(_$_FilterTransactionState) _then)
      : super(_value, (v) => _then(v as _$_FilterTransactionState));

  @override
  _$_FilterTransactionState get _value =>
      super._value as _$_FilterTransactionState;

  @override
  $Res call({
    Object? filterList = freezed,
    Object? isFilter = freezed,
    Object? fitlerDropdownValue = freezed,
  }) {
    return _then(_$_FilterTransactionState(
      filterList: filterList == freezed
          ? _value._filterList
          : filterList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      isFilter: isFilter == freezed
          ? _value.isFilter
          : isFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      fitlerDropdownValue: fitlerDropdownValue == freezed
          ? _value.fitlerDropdownValue
          : fitlerDropdownValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FilterTransactionState implements _FilterTransactionState {
  const _$_FilterTransactionState(
      {required final List<TransactionModel> filterList,
      required this.isFilter,
      required this.fitlerDropdownValue})
      : _filterList = filterList;

  final List<TransactionModel> _filterList;
  @override
  List<TransactionModel> get filterList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterList);
  }

  @override
  final bool isFilter;
  @override
  final String fitlerDropdownValue;

  @override
  String toString() {
    return 'FiltertransactionState(filterList: $filterList, isFilter: $isFilter, fitlerDropdownValue: $fitlerDropdownValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterTransactionState &&
            const DeepCollectionEquality()
                .equals(other._filterList, _filterList) &&
            const DeepCollectionEquality().equals(other.isFilter, isFilter) &&
            const DeepCollectionEquality()
                .equals(other.fitlerDropdownValue, fitlerDropdownValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filterList),
      const DeepCollectionEquality().hash(isFilter),
      const DeepCollectionEquality().hash(fitlerDropdownValue));

  @JsonKey(ignore: true)
  @override
  _$$_FilterTransactionStateCopyWith<_$_FilterTransactionState> get copyWith =>
      __$$_FilterTransactionStateCopyWithImpl<_$_FilterTransactionState>(
          this, _$identity);
}

abstract class _FilterTransactionState implements FiltertransactionState {
  const factory _FilterTransactionState(
      {required final List<TransactionModel> filterList,
      required final bool isFilter,
      required final String fitlerDropdownValue}) = _$_FilterTransactionState;

  @override
  List<TransactionModel> get filterList => throw _privateConstructorUsedError;
  @override
  bool get isFilter => throw _privateConstructorUsedError;
  @override
  String get fitlerDropdownValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FilterTransactionStateCopyWith<_$_FilterTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}
