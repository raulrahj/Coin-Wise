import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:coin_wise/data/model/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/widgets/dropdown_category.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';
part 'transactions_bloc.freezed.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsState.initial()) {
    on<GetAllTransactions>((event, emit) async {
      double incomeValue = 0;
      double expenseValue = 0;
      double totalBalanceValue = 0;
      List<TransactionModel> _incomeList = [];
      List<TransactionModel> _expenseList = [];
      final _data = await Hive.openBox<TransactionModel>('transaction_Db');
      final _list = _data.values.toList();
      _list.sort((first, second) => second.date.compareTo(first.date));

      await Future.forEach(_list, (TransactionModel transactions) async {
        if (transactions.field == CategoryField.income) {
          _incomeList.add(transactions);
          incomeValue += transactions.amount;
          totalBalanceValue += transactions.amount;
        } else {
          _expenseList.add(transactions);
          expenseValue += transactions.amount;
          totalBalanceValue -= transactions.amount;
        }

        emit(state.copyWith(
            transactionList: _list,
            isAdd: state.isAdd,
            isIncome: state.isIncome,
            incomeBal: incomeValue,
            expenseBal: expenseValue,
            totalBal: totalBalanceValue));
      });
    });
    on<AddTransaction>((event, emit) async {
      print('in add transaction');
      final transactionDB =
          await Hive.openBox<TransactionModel>('transaction_Db');
          
      // transactionDB.clear();
      await transactionDB.put(event.model.id, event.model);
      // emit(state.copyWith(TransactionsState(transactionList: )))
      add(const TransactionsEvent.getAllTransactions());
    });
    on<UpdateTransaction>((event, emit) async {
      final _transactionDb =
          await Hive.openBox<TransactionModel>('transaction_Db');
      _transactionDb.put(event.id, event.model);
      add(const TransactionsEvent.getAllTransactions());
      // dropDownValue = null;
    });
    on<DeleteTransaction>((event, emit) async {
      final _transactionDb =
          await Hive.openBox<TransactionModel>('transaction_Db');
      _transactionDb.delete(event.keey);
      add(const TransactionsEvent.getAllTransactions());
      print('deleting');
      emit(state.copyWith(transactionList: state.transactionList));
    });
    on<TransactionController>((event, emit) async {
      print('in the events ${event.isIncome}');
      emit(state.copyWith(
        //transactionList: state.transactionList,
        isAdd: event.isAdd,
        isIncome: event.isIncome,
      ));
    });
    // on<TransactionType>((event, emit) async{
    //   print('it\'s okey');
    //    emit(state.copyWith(
    //       isAdd: event.isAdd,
    //       isIncome: event.isIncome,
    //       ));
    // });
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
        case 'Income':
          emit(state.copyWith(
            separateTransactionList: _incomeList,
          ));
          break;
        case 'Expense':
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
    on<ChangeddValue>((event, emit) {
      emit(state.copyWith(dropDownValue: event.ddValue));
    });
  }
}
