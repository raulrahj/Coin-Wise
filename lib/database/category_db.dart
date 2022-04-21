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
  ValueNotifier<List<CategoryModel>> amountCategoryListner = ValueNotifier([]);

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
  }

  Future<void> refreshUI() async {
    incomeCategoryListner.value.clear();
    expenseCategoryListner.value.clear();
    final _allCategoryModel = await getCategory();
    await Future.forEach(_allCategoryModel, (CategoryModel category) {
      if (category.field == CategoryField.income) {
        incomeCategoryListner.value.add(category);
      } else {
        expenseCategoryListner.value.add(category);
      }
    });
    incomeCategoryListner.notifyListeners();
    expenseCategoryListner.notifyListeners();
  }

  Future<void> categoryAmountAdding() async {
    final List<TransactionModel> _listener =
        TransactionDbFunctions.instance.transactionListener.value;

    await Future.forEach(amountCategoryListner.value,
        (CategoryModel category) async {
      double amount = 0;
  
      final selectedCategory = category.name;
      final seletedCategoryData = category;
      await Future.forEach(_listener, (TransactionModel transaction) async {
        final currentTransactionCategory = transaction.category.name;
       
        if (selectedCategory == currentTransactionCategory &&
            category.field == transaction.category.field) {
     
         amount = amount + transaction.amount;
         
        } else {
          throw '{CATEGORY  DOESNT MATCH}';
        }
        // await Future.forEach(incomeCategoryListner.value, ( element) async {
        //     element.
        // });
        if (selectedCategory == currentTransactionCategory) {
          final CategoryModel _updatedData = CategoryModel(
              id: seletedCategoryData.id,
              name: seletedCategoryData.name,
              field: seletedCategoryData.field,
              categoryAmount: amount);
         updateCategory(_updatedData);
          amountCategoryListner.notifyListeners();
          incomeCategoryListner.notifyListeners();
          expenseCategoryListner.notifyListeners();
          // refreshUI();
          //  }
        }
      });
    });
  }
}
