part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

}

class TransactionsInitial extends TransactionsState {
  final List<TransactionModel> transactionList;

  const TransactionsInitial({required this.transactionList});
  
  @override
  List<Object> get props => [];
}
