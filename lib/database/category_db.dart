import 'package:coin_wise/constants/functions.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/cupertino.dart';

class CategoryFunctions {
  CategoryFunctions._internal();
  static CategoryFunctions instance = CategoryFunctions._internal();
  factory CategoryFunctions() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryListner = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListner = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> incomeAmountCategoryListner =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseAmountCategoryListner =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> multiAmountCategoryListener =
      ValueNotifier([]);

  Future<void> insertCategory(value) async {
    final categoryDB = await Hive.openBox<CategoryModel>('categoryDb');
    // await categoryDB.clear();
    categoryDB.put(value.id, value);

    refreshUI();
  }

  Future<List<CategoryModel>> getCategory() async {
    final categoryDB = await Hive.openBox<CategoryModel>('categoryDb');
    return categoryDB.values.toList();
  }

  Future<void> deleteCategory(key, context) async {
    final categoryDB = await Hive.openBox<CategoryModel>('categoryDb');

    categoryDB.delete(key);

    refreshUI();
    Navigator.pop(context);
  }

  Future<void> updateCategory(value) async {
    final categoryDb = await Hive.openBox<CategoryModel>('categoryDb');
    categoryDb.put(value.id, value);
    refreshUI();
    // categoryDb.clear();
  }

  Future<void> refreshUI() async {
    incomeCategoryListner.value.clear();
    expenseCategoryListner.value.clear();
    final _allCategoryModel = await getCategory();
    _allCategoryModel.sort((first, second) => second.id.compareTo(first.id));
    await Future.forEach(_allCategoryModel, (CategoryModel category) {
      if (category.field == CategoryField.income) {
        incomeCategoryListner.value.add(category);
      } else {
        expenseCategoryListner.value.add(category);
      }
    });

    incomeCategoryListner.notifyListeners();
    expenseCategoryListner.notifyListeners();
    refreshCategoryAmountListners();
    // availableCategories();
  }

  List<String> availableIncomeCategories = [];
  List<String> availableExpenseCategories = [];
  void availableCategories() {
    print('TWO');
    List<TransactionModel> _list =
        TransactionDbFunctions.instance.transactionListener.value.toList();
    Future.forEach<TransactionModel>(_list, (element) {
      if (element.field == CategoryField.income &&
          !availableIncomeCategories.contains(element.category.name)) {
        availableIncomeCategories.add(element.category.name);
      } else if (element.field == CategoryField.expense &&
          !availableExpenseCategories.contains(element.category.name)) {
        availableExpenseCategories.add(element.category.name);
      }
    });
    incomeListing();
    expenseListing();
  }

  void incomeListing() {
    print('THREEE ');
    late CategoryModel inc;
    final incomeCategories = incomeCategoryListner.value.toList();

    for (int i = 0; i < availableIncomeCategories.length; i++) {
      for (int j = 0; j < incomeCategories.length; j++) {
        if (availableIncomeCategories[i] == incomeCategories[j].name) {
          inc = incomeCategories[i];
        }
      }
      incomeAmountCategoryListner.value.add(inc);
    }
  }

  void expenseListing() {
   
    print('FOUR');
    CategoryModel? exp;
    final expenseCategories = expenseCategoryListner.value.toList();

    for (int i = 0; i < availableExpenseCategories.length; i++) {
      print('length of available expense cat ${availableExpenseCategories.length}');
      for (int j = 0; j < expenseCategories.length; j++) {
        if (availableExpenseCategories[i] == expenseCategories[j].name) {
          exp = expenseCategories[i];
        }
      }
      
      expenseAmountCategoryListner.value.add(exp!);
      print(' >>>>>>>>>>>>>>>>>>${exp.name}<<<<<<<<<<<<<<<<<<<<<<');
    }
  }

  Future<void> categoryAmounts() async {
    print('ONE');
    availableCategories();
    final allTransactions =
        await TransactionDbFunctions.instance.getTransaction();

    for (int i = 0; i < incomeAmountCategoryListner.value.length; i++) {
      print('FIVE');
     
      double amount = 0;

      Future.forEach(allTransactions, (TransactionModel _transaction)async{
        if (_transaction.category.name ==
            incomeAmountCategoryListner.value[i].name) {
          amount += _transaction.amount;
        }

        if (incomeAmountCategoryListner.value[i].name ==
            _transaction.category.name) {
          // refreshCategoryAmountListners();
          incomeAmountCategoryListner.value[i].categoryAmount = 0;
          incomeAmountCategoryListner.value[i].categoryAmount =
              incomeAmountCategoryListner.value[i].categoryAmount! + amount;
        }
      });
    }


    for (int i = 0; i < expenseAmountCategoryListner.value.length; i++) {
       print(
          'length of expense Category Listener ${expenseAmountCategoryListner.value.length}');

     
      double amount = 0;
      // expenseAmountCategoryListner.value[i].categoryAmount = 0;

      Future.forEach(allTransactions, (TransactionModel _transaction) async {
        if (_transaction.category == expenseAmountCategoryListner.value[i]) {
          amount += _transaction.amount;
          // print(expenseAmountCategoryListner.value[i].categoryAmount);
        }

        if (expenseAmountCategoryListner.value[i].name ==
            _transaction.category.name) {
          expenseAmountCategoryListner.value[i].categoryAmount = 0;
          expenseAmountCategoryListner.value[i].categoryAmount =
              expenseAmountCategoryListner.value[i].categoryAmount! + amount;
        }
      });
    }
    refreshCategoryAmountListners();
    print('EXITED SUCCESSFULLY');
  }
}
