import 'package:bloc/bloc.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/widgets/dropdown_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';
part 'transactions_bloc.freezed.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsState.initial()) {
    on<GetAllTransactions>((event, emit) async {
      final data = await Hive.openBox<TransactionModel>('transaction_Db');
      emit(TransactionsState(transactionList: data.values.toList()));
    });
    on<AddTransaction>((event, emit) async {
      final transactionDB =
          await Hive.openBox<TransactionModel>('transaction_Db');
      // transactionDB.clear();
      await transactionDB.put(event.model.id, event.model);
      // emit(state.copyWith(TransactionsState(transactionList: )))
      add(const GetAllTransactions());
    });
    on<UpdateTransaction>((event, emit) async{
            final _transactionDb =
        await Hive.openBox<TransactionModel>('transaction_Db');
    _transactionDb.put(event.id, event.model);
    add(const TransactionsEvent.getAllTransactions());
    dropDownValue = null;
    });
    on<DeleteTransaction>((event, emit) async{
       final _transactionDb =
        await Hive.openBox<TransactionModel>('transaction_Db');
    _transactionDb.delete(event.keey);
    add(const TransactionsEvent.getAllTransactions());
    });
  }
}
