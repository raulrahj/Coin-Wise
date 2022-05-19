part of 'transactions_bloc.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required List<TransactionModel> transactionList,
    required List<TransactionModel> separateTransactionList,
    required List<CategoryModel> categories,
    required String dropDownValue,
    required bool isAdd,
    required bool isIncome,
    required double incomeBal,
    required double expenseBal,
    required double totalBal,
  }) = _TransactionsState;

  factory TransactionsState.initial() => const TransactionsState(
        isAdd: true,
        isIncome: true,
        dropDownValue: '',
        categories: [],
        transactionList: [],
        separateTransactionList: [], expenseBal: 0.0, incomeBal: 0.0, totalBal: 0.0,
      );
}
