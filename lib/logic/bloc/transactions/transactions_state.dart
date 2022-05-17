part of 'transactions_bloc.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required List<TransactionModel> transactionList,
  }) = _TransactionsState;

  factory TransactionsState.initial() => TransactionsState(transactionList: []);
}
