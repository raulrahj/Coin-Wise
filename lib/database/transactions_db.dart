import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/main.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TransactionDbFunctions {
  //<<<<<<<< SINGLE TUN >>>>>>>>>>>
  TransactionDbFunctions._internal();
  static TransactionDbFunctions instance = TransactionDbFunctions._internal();
  factory TransactionDbFunctions() {
    return instance;
  }

  //<<<<<<<<<<<<<<<<< VALUE NOTIFIERS >>>>>>>>>>>>>>>>>>>>
  ValueNotifier<List<TransactionModel>> transactionListener = ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> transactionIncomeListener =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> transactionExpenseListener =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> selectedRangeTransactionsListener =
      ValueNotifier([]);
  ValueNotifier<Wallet> walletDataListener = ValueNotifier(Wallet());

  //<<<<<<<<<<<<< TRANSACTION ADDING >>>>>>>>>>>>>>>
  Future<void> addTransaction(TransactionModel value) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>('transaction_Db');
    // transactionDB.clear();
    await transactionDB.put(value.id, value);
    CategoryFunctions.instance.categoryAmountAdding();
    refreshData();
  }

  //<<<<<<<<<<<<< UPDATING UI WITH LISTENERS >>>>>>>>>>>.
  Future<void> refreshData() async {
    final _list = await getTransaction();
    transactionListener.value.clear();
    transactionIncomeListener.value.clear();
    transactionExpenseListener.value.clear();
    transactionListener.value.addAll(_list);
    transactionListener.notifyListeners();
    final _allTransaction = await getTransaction();
    // walletDataListener.notifyListeners(); // @@@@@@@@@@@@@@@@
    await Future.forEach(_allTransaction,
        (TransactionModel transactions) async {
      if (transactions.field == CategoryField.income) {
        transactionIncomeListener.value.add(transactions);
      } else {
        transactionExpenseListener.value.add(transactions);
      }
      getWallet(_list);
      /////////////// TO DO REFRESH DATA FUNCTION RECURSIVLY CALLLING /////////

      //  print(transactions.amount);
      // print('function checkig');

      transactionExpenseListener.notifyListeners();
      transactionIncomeListener.notifyListeners();
    });
  }

  //<<<<<<<<<<< GETTING DATA FROM DATABASE >>>>>>>>>>>>>>>>
  Future<List<TransactionModel>> getTransaction() async {
    final _transactionDatabase =
        await Hive.openBox<TransactionModel>('transaction_Db');
    return _transactionDatabase.values.toList();
  }

  //<<<<<<<<<<<< DELETE TRANSACTION >>>>>>>>>>>>>>> 
  Future<void> deleteTransaction(context, key) async {
    final _transactionDb =
        await Hive.openBox<TransactionModel>('transaction_Db');
    _transactionDb.delete(key);
    CategoryFunctions.instance.categoryAmountAdding();
    refreshData();
    // TransactionDbFunctions.instance.getWallet();
  }

  //<<<<<<<<<<<<<<<< UPDATING TRANSACTION >>>>>>>>>>>
  Future<void> updateTransaction(key, value) async {
    final _transactionDb =
        await Hive.openBox<TransactionModel>('transaction_Db');
    _transactionDb.put(key, value);
    CategoryFunctions.instance.categoryAmountAdding();

    refreshData();
    // _transactionDb.clear();
  }

  Future<void> clearTransaction() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>('transaction_Db');
    transactionDB.clear();
    navigatorKey?.currentState?.pop();
    refreshData();
  }

  // <<<<<<<<<< GETTING WALLET AMOUNT >>>>>>>>>>>>>

  Future<void> getWallet(List<TransactionModel> _listener) async {
    print('get all called ');
    walletDataListener.value = Wallet();

    await Future.forEach(_listener, (TransactionModel wallet) async {
      print('foreach all called ');
      if (wallet.field == CategoryField.income) {
        walletDataListener.value.income =
            walletDataListener.value.income + wallet.amount;
      } else {
        walletDataListener.value.expense += wallet.amount;
      }
    });
    print('coming out of foreach ');
    // print(walletDataListener.value.totalBalance);
    walletDataListener.value.totalBalance =
        walletDataListener.value.income - walletDataListener.value.expense;
    walletDataListener.notifyListeners();
  }
}

class Wallet {
  // Wallet._internal();
  // static Wallet instance = Wallet._internal();
  // factory Wallet() {
  //   return instance;
  // }
  double income;
  double expense;
  double totalBalance;
  Wallet({this.income = 0, this.expense = 0, this.totalBalance = 0});
}
