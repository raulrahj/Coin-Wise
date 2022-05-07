import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/models/transaction_model.dart';

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
    List<TransactionModel> _list =
        TransactionDbFunctions.instance.transactionListener.value.toList();
        print('the main list ${_list.length}');
    Future.forEach<TransactionModel>(_list, (element) {
      if (element.field == CategoryField.income &&
          !availableIncomeCategories.contains(element.category.name)) {
            print('item listing${element.category.name}');
        availableIncomeCategories.add(element.category.name);
      } else if (element.field == CategoryField.expense &&
          !availableExpenseCategories.contains(element.category.name)) {
        availableExpenseCategories.add(element.category.name);
      }
    });
    incomeListing();
    expenseListing();
    print('new');
    print(availableIncomeCategories.length);
    availableIncomeCategories.remove('Bonus');
    print(availableIncomeCategories);
  }

  void incomeListing() async{
    late CategoryModel inc;
    final incomeCategories = incomeCategoryListner.value.toList();
    for (int i = 0; i < availableIncomeCategories.length; i++) {
      print("listener lenght ${incomeCategoryListner.value.length}");
      for (int j = 0; j < incomeCategories.length; j++) {
        if (availableIncomeCategories[i] == incomeCategories[j].name) {
          print(!incomeAmountCategoryListner.value.toList().contains(incomeCategories[j]));
          inc = incomeCategories[j];
          print(incomeCategories[j].name);
        }
      }
      // incomeAmountCategoryListner.value.clear();
      // for(int i=0;i<incomeAmountCategoryListner.value.length;i++){
        if(!incomeAmountCategoryListner.value.contains(inc)&&!availableIncomeCategories.contains(inc.name)){
                incomeAmountCategoryListner.value.add(inc);

        // }
      }
      incomeAmountCategoryListner.notifyListeners();
    }
    print("first${incomeAmountCategoryListner.value.toList().length}");
  }

  void expenseListing() {
    CategoryModel? exp;
    final expenseCategories = expenseCategoryListner.value;
    expenseAmountCategoryListner.value.clear();
    for (int i = 0; i < availableExpenseCategories.length; i++) {
      for (int j = 0; j < expenseCategories.length; j++) {
        if (availableExpenseCategories[i] == expenseCategories[j].name) {
          exp = expenseCategories[j];
        }
      }
      if(!expenseAmountCategoryListner.value.contains(exp)){
      expenseAmountCategoryListner.value.add(exp!);
      }
    }
  }

  Future<void> categoryAmounts() async {
    availableCategories();
    final allTransactions =
        await TransactionDbFunctions.instance.getTransaction();

    for (int i = 0; i < incomeAmountCategoryListner.value.length; i++) {
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
      double amount = 0;

      Future.forEach(allTransactions, (TransactionModel _transaction) async {
        if (_transaction.category.name ==
            expenseAmountCategoryListner.value[i].name) {
          amount += _transaction.amount;
        }

        if (expenseAmountCategoryListner.value[i].name ==
            _transaction.category.name) {
          expenseAmountCategoryListner.value[i].categoryAmount = 0;
          expenseAmountCategoryListner.value[i].categoryAmount =
              expenseAmountCategoryListner.value[i].categoryAmount! + amount;
        }
      });
    }
  }
}

void incomeList()async {

  CategoryFunctions.instance.multiAmountCategoryListener.value.clear();

  final _list0 =
      CategoryFunctions.instance.incomeAmountCategoryListner.value.toList();
  if (_list0.length > 2 && _list0.isNotEmpty ) {
    _list0.sort((first, second) =>
        second.categoryAmount!.compareTo(first.categoryAmount!));
  }
  print(CategoryFunctions.instance.incomeAmountCategoryListner.value.length);

  // if (_list0[0] == null ||
  //     CategoryFunctions.instance.incomeAmountCategoryListner.value.isEmpty) {
  //   CategoryFunctions.instance.incomeAmountCategoryListner.value.clear();
  //   CategoryFunctions.instance.multiAmountCategoryListener.value.clear();
  // }
for(int i =0; i<_list0.length; i++){
  print('l0 ${_list0.length}');
  if(_list0[i].categoryAmount!=null){
    print('is it');
  // CategoryFunctions.instance.multiAmountCategoryListener.value.clear();
   CategoryFunctions.instance.multiAmountCategoryListener.value.add(_list0[i]);
  // CategoryFunctions.instance.multiAmountCategoryListener.value = _list0;
  refreshCategoryAmountListners();
  }
}
}
// }

void expenseList() {
  CategoryFunctions.instance.multiAmountCategoryListener.value.clear();

  final _list1 =
      CategoryFunctions.instance.expenseAmountCategoryListner.value.toList();
  if (_list1.length > 2 && _list1[1] != null && _list1.isNotEmpty) {
    _list1.sort((first, second) =>
        second.categoryAmount!.compareTo(first.categoryAmount!));
  }
  CategoryFunctions.instance.multiAmountCategoryListener.value.clear();
  CategoryFunctions.instance.multiAmountCategoryListener.value = _list1;
  refreshCategoryAmountListners();
}

void refreshCategoryAmountListners() {
  CategoryFunctions.instance.multiAmountCategoryListener.notifyListeners();
  CategoryFunctions.instance.incomeAmountCategoryListner.notifyListeners();
  CategoryFunctions.instance.expenseAmountCategoryListner.notifyListeners();
}
