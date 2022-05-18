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
  const factory TransactionsEvent.transactionController(
      {required bool isAdd,
      required bool isIncome,
      required List<CategoryModel> categories,
      required String dropDownValue}) = TransactionController;
}
