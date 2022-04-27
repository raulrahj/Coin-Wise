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
    print('Length of Available expenes categories is : ${availableExpenseCategories.length}');
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
    List<CategoryModel> explist =[];
    final expenseCategories = expenseCategoryListner.value;
  print("again checking the length ${availableExpenseCategories.length}");
  print(expenseCategories.length);
        expenseAmountCategoryListner.value.clear();
    for (int i = 0; i < availableExpenseCategories.length; i++) {
        print(' <<<<<<$i>>>>>');
      for (int j = 0; j < expenseCategories.length; j++) {
        if (availableExpenseCategories[i] == expenseCategories[j].name) {
          exp = expenseCategories[j];
          print('match??');
          print(expenseCategories[j].name);
          print('available');
          print(availableExpenseCategories[i]);

          // explist.add(expenseCategories[i]);
        }
      // print(explist[i].name);
      }
      expenseAmountCategoryListner.value.add(exp!);

print(expenseAmountCategoryListner.value.length);
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

      Future.forEach(allTransactions, (TransactionModel _transaction) async {
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
      print('SiX');
      double amount = 0;
      // expenseAmountCategoryListner.value[i].categoryAmount = 0;

      Future.forEach(allTransactions, (TransactionModel _transaction) async {
        if (_transaction.category.name == expenseAmountCategoryListner.value[i].name) {
          amount += _transaction.amount;
          print('amount of expense $amount');
          
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
    // refreshCategoryAmountListners();
    print('EXITED SUCCESSFULLY');
  }
}


void incomeList()  {
      CategoryFunctions.instance.multiAmountCategoryListener.value.clear();

  final _list0 =
      CategoryFunctions.instance.incomeAmountCategoryListner.value.toList();
      print(_list0.length);
  if (_list0.isEmpty) {
    return;
    
  } else {
    _list0.sort((first, second) =>
        second.categoryAmount!.compareTo(first.categoryAmount!));
    // Future.forEach(_list0, (CategoryModel element) async {
      // if(element.field==CategoryField.income){
      CategoryFunctions.instance.multiAmountCategoryListener.value.clear();
      CategoryFunctions.instance.multiAmountCategoryListener.value = _list0;
      // CategoryFunctions.instance.multiAmountCategoryListener.value.add(element);
      refreshCategoryAmountListners();
      // }
    // });
  }
}

void expenseList() {
  print('this is expense list');
  CategoryFunctions.instance.multiAmountCategoryListener.value.clear();

  final _list1 =
      CategoryFunctions.instance.expenseAmountCategoryListner.value.toList();
      print('Length of List 1 is : ${_list1.length}');
  _list1.sort((first, second) =>
      second.categoryAmount!.compareTo(first.categoryAmount!));
  CategoryFunctions.instance.multiAmountCategoryListener.value.clear();
  CategoryFunctions.instance.multiAmountCategoryListener.value = _list1;
  print('list 1 length ${_list1.length}');
  print('Related ${CategoryFunctions.instance.multiAmountCategoryListener.value.length}');
  refreshCategoryAmountListners();
}

void refreshCategoryAmountListners() {
  print('notifier called');
  //  CategoryFunctions.instance. categoryAmounts();
  CategoryFunctions.instance.multiAmountCategoryListener.notifyListeners();
  CategoryFunctions.instance.incomeAmountCategoryListner.notifyListeners();
  CategoryFunctions.instance.expenseAmountCategoryListner.notifyListeners();
}
