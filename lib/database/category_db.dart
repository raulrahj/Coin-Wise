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

  }
  List<String> returnIncome(){
    // if(incomeAmountCategoryListner.value.isEmpty){
    //   return;
    // }
     List<String> _checkList=[]; 
    List<CategoryModel> _list= incomeAmountCategoryListner.value;
    Future.forEach(_list,(CategoryModel element) {
      // if(element.field==CategoryField.income) {
   _checkList.add( element.name);
   print('The check list values are $_checkList');
  

      // }
    
    });
   return _checkList;
    
  }

  Future<void> categoryAmounts() async {
    List<String> _newList =returnIncome();
  final allTransactions =
        await TransactionDbFunctions.instance.getTransaction();
    final allCategories = await getCategory();

    print('C A T E G O R Y     A M O U N T S F U N C T I O N    I S     W O R K I N G . . .');
   List<String> _checkList=[]; 
    Future.forEach(allTransactions,(TransactionModel element) {
      if(element.field==CategoryField.income) {
   _checkList.add( element.category.name);
   print('The check list values are $_checkList');
      }
    });
    print('THE COTEGORY AMOUNT ADDING FUNCTION WAS WORKING NOW.....');
    _newList = _checkList;
  

// for(int i=0;i<incomeAmountCategoryListner.value.length;i++){
    Future.forEach(allTransactions, (TransactionModel selectedTransaction)async {
      print('ok forEach accepted');
      print(selectedTransaction.category.field.toString());
      if (selectedTransaction.category.field == CategoryField.income ) {
        print('Field checking ok');
          Future.forEach(_newList,(String element) async{
            print(' I think the checklist is pending');
              if(element==selectedTransaction.category.name){
                print('so this will be the false');
        print('T H E S E L E C T E D  C A T E G O R Y I N T R A N S A C T I O N I S ${selectedTransaction.category.name}');

        incomeAmountCategoryListner.value.add(selectedTransaction.category);
        incomeAmountCategoryListner.notifyListeners();
              }
          });
  
      } else if (selectedTransaction.category.field == CategoryField.expense) {
        expenseAmountCategoryListner.value.add(selectedTransaction.category);
        expenseAmountCategoryListner.notifyListeners();
      }
    });
// }
    for (int i = 0; i < incomeAmountCategoryListner.value.length; i++) {
      double amount = 0;
      print('FOR LOOP LENGTH IS : $i');
      print(incomeAmountCategoryListner.value[i].name);
      print(incomeAmountCategoryListner.value[i].categoryAmount);
      Future.forEach(allTransactions, (TransactionModel _transaction) {
        if (_transaction.category == incomeAmountCategoryListner.value[i]) {
          amount += _transaction.amount;
        }
      
        if (incomeAmountCategoryListner.value[i].name ==
            _transaction.category.name) {
              // refreshCategoryAmountListners();
          incomeAmountCategoryListner.value[i].categoryAmount = 0;
          incomeAmountCategoryListner.value[i].categoryAmount =
              incomeAmountCategoryListner.value[i].categoryAmount! + amount;
              print('A M O U N T $amount');
        }
      });
    }
    for (int i = 0; i < expenseAmountCategoryListner.value.length; i++) {
      print('FOR LOOP LENGTH E  x p e n s e : $i');
      double amount = 0;
          expenseAmountCategoryListner.value[i].categoryAmount = 0;
      print(expenseAmountCategoryListner.value[i].name);
      print(expenseAmountCategoryListner.value[i].categoryAmount);
      Future.forEach(allTransactions, (TransactionModel _transaction) {
        if (_transaction.category == expenseAmountCategoryListner.value[i]) {
          amount += _transaction.amount;
        }
      
        if (expenseAmountCategoryListner.value[i].name ==
            _transaction.category.name) {
              // refreshCategoryAmountListners();
              print('the listener category name ${expenseAmountCategoryListner.value[i].name}');
              print('the transaction category name ${_transaction.category.name}');
          // expenseAmountCategoryListner.value[i].categoryAmount = 0;
          expenseAmountCategoryListner.value[i].categoryAmount =
              expenseAmountCategoryListner.value[i].categoryAmount! + amount;
        }
      });
    }
     refreshCategoryAmountListners();
  }
}
