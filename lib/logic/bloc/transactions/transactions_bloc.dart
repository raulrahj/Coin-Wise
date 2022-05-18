import 'package:bloc/bloc.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/models/category_model.dart';
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
      emit(state.copyWith(
        transactionList: data.values.toList(),
        isAdd: state.isAdd,
        isIncome: state.isIncome,
      ));
    });
    on<AddTransaction>((event, emit) async {
      final transactionDB =
          await Hive.openBox<TransactionModel>('transaction_Db');
      // transactionDB.clear();
      await transactionDB.put(event.model.id, event.model);
      // emit(state.copyWith(TransactionsState(transactionList: )))
      add(const GetAllTransactions());
    });
    on<UpdateTransaction>((event, emit) async {
      final _transactionDb =
          await Hive.openBox<TransactionModel>('transaction_Db');
      _transactionDb.put(event.id, event.model);
      add(const TransactionsEvent.getAllTransactions());
      dropDownValue = null;
    });
    on<DeleteTransaction>((event, emit) async {
      final _transactionDb =
          await Hive.openBox<TransactionModel>('transaction_Db');
      _transactionDb.delete(event.keey);
      add(const TransactionsEvent.getAllTransactions());
    });
    on<TransactionController>((event, emit) {
      emit(state.copyWith(
          transactionList: state.transactionList,
          isAdd: event.isAdd,
          isIncome: event.isIncome));
    });
    on<SeparateTransactions>((event, emit) async {
      List<TransactionModel> _incomeList = [];
      List<TransactionModel> _expenseList = [];

      final _transactionDb =
          await Hive.openBox<TransactionModel>('transaction_Db');
      final _list = _transactionDb.values.toList();
      _list.sort((first, second) => second.date.compareTo(first.date));

      await Future.forEach(_list, (TransactionModel transactions) async {
        if (transactions.field == CategoryField.income) {
          _incomeList.add(transactions);
        } else {
          _expenseList.add(transactions);
        }
      });
      switch (event.listType) {
        case  'Income' : 
           emit(state.copyWith(
          separateTransactionList: _incomeList,
          ));
          break;
        case 'Expense' : 
           emit(state.copyWith(
          separateTransactionList: _expenseList,
          ));
          break;

        default:
         emit(state.copyWith(
          separateTransactionList: state.transactionList,
          ));
      }
     
    });
  }
}
