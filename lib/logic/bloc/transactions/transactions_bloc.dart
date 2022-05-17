import 'package:bloc/bloc.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsInitial(transactionList:Hive.box<TransactionModel>('transactions_db').values.toList())) {
    on<AddTransaction>((event, emit) {
     emit(TransactionsInitial(transactionList:Hive.box<TransactionModel>('transactions_db').values.toList()));
    });
  }
}
