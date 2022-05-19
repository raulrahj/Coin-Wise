// ! import 'package:coin_wise/main.dart';
// ! import 'package:flutter/material.dart';
// ! import 'package:flutter/cupertino.dart';
// ! import 'package:hive_flutter/adapters.dart';
// ! import 'package:coin_wise/models/category_model.dart';
// ! import 'package:coin_wise/models/transaction_model.dart';

// ! class TransactionDbFunctions {
  // !  SINGLE TUN >>>>>>>>>>>
// !   TransactionDbFunctions._internal();
// !   static TransactionDbFunctions instance = TransactionDbFunctions._internal();
// !   factory TransactionDbFunctions() {
// !     return instance;
// !   }
// ! }
  // !<<<<<<<<<<<<<<<<< VALUE NOTIFIERS >>>>>>>>>>>>>>>>>>>>
  // ! ValueNotifier<List<TransactionModel>> transactionListener = ValueNotifier([]);
  // ! ValueNotifier<List<TransactionModel>> transactionIncomeListener =
  // !     ValueNotifier([]);
  // ! ValueNotifier<List<TransactionModel>> transactionExpenseListener =
  // !     ValueNotifier([]);
  // ! ValueNotifier<List<TransactionModel>> selectedRangeTransactionsListener =
  // !     ValueNotifier([]);
  // ! ValueNotifier<double> walletDataListener = ValueNotifier(totalBalanceValue);
  // ! ValueNotifier<double> walletIncomeListener = ValueNotifier(incomeValue);
  // ! ValueNotifier<double> walletExpenseListener = ValueNotifier(expenseValue);

  // !<<<<<<<<<<<<< TRANSACTION ADDING >>>>>>>>>>>>>>>
  // ! Future<void> addTransaction(TransactionModel value) async {
    // ! final transactionDB =
        // ! await Hive.openBox<TransactionModel>('transaction_Db');
    // ! transactionDB.clear();
    // ! await transactionDB.put(value.id, value);
    // ! CategoryFunctions.instance.categoryAmountAdding();
    // ! refreshData();
  // ! }

  // !<<<<<<<<<<<<< UPDATING UI WITH LISTENERS >>>>>>>>>>>

  // ! Future<void> refreshData() async {
  // !   final _list = await getTransaction();
  // !   _list.sort((first, second) => second.date.compareTo(first.date));

  // !   transactionListener.value.clear();
  // !   transactionIncomeListener.value.clear();
  // !   transactionExpenseListener.value.clear();
  // !   transactionListener.value.addAll(_list);
  // !   transactionListener.notifyListeners();
  // !   final _allTransaction = await getTransaction();
  // !   walletDataListener.notifyListeners(); // !
  // !   await Future.forEach(_allTransaction,
  // !       (TransactionModel transactions) async {
  // !     if (transactions.field == CategoryField.income) {
  // !       transactionIncomeListener.value.add(transactions);
  // !     } else {
  // !       transactionExpenseListener.value.add(transactions);
  // !     }

  // !     walletRefresh();
  // !     walletData();
  // !     transactionExpenseListener.notifyListeners();
  // !     transactionIncomeListener.notifyListeners();
  // !   });
  // !   // ! refreshCategoryAmountListners();
  // ! }

  // ! // !<<<<<<<<<<< GETTING DATA FROM DATABASE >>>>>>>>>>>>>>>>
  // ! Future<List<TransactionModel>> getTransaction() async {
  // !   final _transactionDatabase =
  // !       await Hive.openBox<TransactionModel>('transaction_Db');
  // !   return _transactionDatabase.values.toList();
  // ! }

  // ! // !<<<<<<<<<<<< DELETE TRANSACTION >>>>>>>>>>>>>>>
  // ! Future<void> deleteTransaction(context, key) async {
  // !   final _transactionDb =
  // !       await Hive.openBox<TransactionModel>('transaction_Db');
  // !   _transactionDb.delete(key);
  // !   refreshData();
  // !   walletData();
  // !   // ! CategoryFunctions.instance.availableCategories();
  // ! }

  // ! // !<<<<<<<<<<<<<<<< UPDATING TRANSACTION >>>>>>>>>>>
  // ! Future<void> updateTransaction(key, value) async {
  // !   final _transactionDb =
  // !       await Hive.openBox<TransactionModel>('transaction_Db');
  // !   _transactionDb.put(key, value);
  // !   dropDownValue = null;

  // !   refreshData();
  // !   // ! _transactionDb.clear();
  // ! }

  // ! Future<void> clearTransaction() async {
  // !   final transactionDB =
  // !       await Hive.openBox<TransactionModel>('transaction_Db');
  // !   transactionDB.clear();
  // !   navigatorKey?.currentState?.pop();
  // !   // ! refreshData();
  // !   walletDataListener.value = 0;
  // !  walletIncomeListener.value = 0;
  // !  walletExpenseListener.value = 0;
  // !   walletRefresh();
  // !   walletData();
  // ! }

  // ! Future<void> walletData() async {
  // !   incomeValue = 0;
  // !   expenseValue = 0;
  // !   totalBalanceValue = 0;
  // !   walletExpenseListener.value = 0;
  // !   walletIncomeListener.value = 0;
  // !   walletDataListener.value = 0;
  // !   final source =  await Hive.openBox<TransactionModel>('transaction_Db');
  // !   List<TransactionModel> _data =source.values.toList();
  // !   Future.forEach(_data, (TransactionModel wallet) {
  // !     if (wallet.field == CategoryField.income) {
  // !       walletIncomeListener.value += wallet.amount;
  // !       walletDataListener.value += wallet.amount;
  // !     } else {
  // !       walletExpenseListener.value += wallet.amount;
  // !       walletDataListener.value -= wallet.amount;
  // !     }
  // !     walletRefresh();
  // !   });
  // ! }


// ! class Wallet {
// ! Wallet._internal();
// ! static Wallet instance = Wallet._internal();
// ! factory Wallet() {
// !   return instance;
// ! }

// ! double incomeValue = 0;
// ! double expenseValue = 0;
// ! double totalBalanceValue = 0;

// ! walletRefresh() {
// !   walletDataListener.notifyListeners();
// !   walletIncomeListener.notifyListeners();
// !   walletExpenseListener.notifyListeners();
// ! }
