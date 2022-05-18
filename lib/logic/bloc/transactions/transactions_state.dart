part of 'transactions_bloc.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required List<TransactionModel> transactionList,
    required List<CategoryModel> categories,
    required String dropDownValue,
    required bool isAdd,
    required bool isIncome,
  }) = _TransactionsState;

  factory TransactionsState.initial() =>
      TransactionsState(transactionList: [], isAdd: true, isIncome: true,categories: [], dropDownValue: '');
}
