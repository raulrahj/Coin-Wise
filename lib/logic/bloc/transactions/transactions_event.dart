part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

}
class AddTransaction extends TransactionsEvent{

  @override
  List<Object> get props => [];
}
class UpdateTransaction extends TransactionsEvent{

  @override
  List<Object> get props => [];
}
class DeleteTransaction extends TransactionsEvent{

  @override
  List<Object> get props => [];
}