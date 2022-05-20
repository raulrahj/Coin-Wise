part of 'transactions_bloc.dart';

@freezed
class TransactionsEvent with _$TransactionsEvent {
  const factory TransactionsEvent.getAllTransactions() = GetAllTransactions;
  const factory TransactionsEvent.addTransaction(
      {required TransactionModel model}) = AddTransaction;
  const factory TransactionsEvent.updateTransaction(
      {required String id,
      required TransactionModel model}) = UpdateTransaction;
  const factory TransactionsEvent.deleteTransaction({required String keey}) =
      DeleteTransaction;
       factory TransactionsEvent.separateTransactions({required String listType}) = SeparateTransactions;
  const factory TransactionsEvent.transactionController(
      {required bool isAdd,
      required bool isIncome,
      }) = TransactionController;
      // const factory TransactionsEvent.transactionType({required bool isAdd,
      // required bool isIncome,}) = TransactionType;
  const factory TransactionsEvent.changeddValue({required String? ddValue})=ChangeddValue;
}
