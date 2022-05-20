import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:coin_wise/data/model/transaction_model.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryState.initial()) {
    on<GetAllCategory>((event, emit) async {
      final categoryDB = await Hive.openBox<CategoryModel>('categoryDb');

      emit(state.copyWith(
          categoryList: categoryDB.values.toList(),
          expenseCategoryList: state.expenseCategoryList,
          incomeCategoryList: state.incomeCategoryList,
          incomeCategoryAmount: state.incomeCategoryAmount,
          expenseCategoryAmout: state.expenseCategoryAmout,
          dropDownValue: state.dropDownValue));
    });
    on<AddCategory>((event, emit) async {
      final categoryDB = await Hive.openBox<CategoryModel>('categoryDb');
      // await categoryDB.clear();
      categoryDB.put(event.model.id, event.model);
      add(const CategoryEvent.getAllCategory());
      emit(state.copyWith(
        categoryList: state.categoryList,
        incomeCategoryList: state.incomeCategoryList,
        expenseCategoryList: state.expenseCategoryList,
      ));
    });
    on<UpdateCategory>((event, emit) async {
      final categoryDb = await Hive.openBox<CategoryModel>('categoryDb');
      categoryDb.put(event.model.id, event.model);
      add(const CategoryEvent.getAllCategory());
    });
    on<DeleteCategory>((event, emit) async {
      final categoryDB = await Hive.openBox<CategoryModel>('categoryDb');
      categoryDB.delete(event.keey);
      add(const CategoryEvent.getAllCategory());
    });
    on<FilterCategories>((event, emit) async {
      final List<CategoryModel> incomeList = [];
      final List<CategoryModel> expenseList = [];
      final _data = await Hive.openBox<CategoryModel>('categoryDb');
      final _allCategoryModel = _data.values.toList();
      _allCategoryModel.sort((first, second) => second.id.compareTo(first.id));
      await Future.forEach(_allCategoryModel, (CategoryModel category) {
        if (category.field == CategoryField.income) {
          incomeList.add(category);
        } else {
          expenseList.add(category);
        }
      });
      emit(state.copyWith(
          categoryList: state.categoryList,
          incomeCategoryList: incomeList,
          expenseCategoryList: expenseList));
    });
    on<CategoryAmounts>((event, emit) async {
      // List<String> availableIncomeCategories = [];
      // List<String> availableExpenseCategories = [];
      Set<CategoryModel> setIncome = Set();
      Set<CategoryModel> setExpense = Set();
      final data = await Hive.openBox<TransactionModel>('transaction_Db');
      final List<TransactionModel> _transactionDatabase = data.values.toList();

      List<CategoryModel> incomeCategoryAmountList = [];
      List<CategoryModel> expenseCategoryAmountList = [];

      // Future.forEach<TransactionModel>(_transactionDatabase, (element) {
      //   print('FIRST');
      //   print('hai___');
      //   if (element.field == CategoryField.income &&
      //       !availableIncomeCategories.contains(element.category.name)) {
      //     availableIncomeCategories.add(element.category.name);
      //   } else if (element.field == CategoryField.expense &&
      //       !availableExpenseCategories.contains(element.category.name)) {
      //     availableExpenseCategories.add(element.category.name);
      //   }
      // });
// !__________________________________________________________________

      Future.forEach<TransactionModel>(_transactionDatabase, (element) {
        if (element.field == CategoryField.income) {
          print('isIncome true..');
          setIncome.add(element.category);
        } else if (element.field == CategoryField.expense) {
          print('isIncome false...');

          setExpense.add(element.category);
        }
      }).then((value) async {
        incomeCategoryAmountList.clear();
        incomeCategoryAmountList.addAll(setIncome.toList());
        expenseCategoryAmountList.clear();
        expenseCategoryAmountList.addAll(setExpense.toList());
        print('print set $setIncome');
      }).then((value) async {
        for (int i = 0; i < incomeCategoryAmountList.length; i++) {
      
          double amount = 0;

          Future.forEach(_transactionDatabase,
              (TransactionModel _transaction) async {
            if (_transaction.category.name ==
                incomeCategoryAmountList[i].name) {
              amount += _transaction.amount;
            }

            if (incomeCategoryAmountList[i].name ==
                _transaction.category.name) {
              incomeCategoryAmountList[i].categoryAmount = 0;
              incomeCategoryAmountList[i].categoryAmount =
                  incomeCategoryAmountList[i].categoryAmount! + amount;
            }
          });
        }

        for (int i = 0; i < expenseCategoryAmountList.length; i++) {
          double amount = 0;

          Future.forEach(_transactionDatabase,
              (TransactionModel _transaction) async {
            if (_transaction.category.name ==
                expenseCategoryAmountList[i].name) {
              amount += _transaction.amount;
            }

            if (expenseCategoryAmountList[i].name ==
                _transaction.category.name) {
              expenseCategoryAmountList[i].categoryAmount = 0;
              expenseCategoryAmountList[i].categoryAmount =
                  expenseCategoryAmountList[i].categoryAmount! + amount;
            }
          });
        }
      }).then((value) async{
           emit(state.copyWith(
          categoryList: state.categoryList,
          incomeCategoryList: state.incomeCategoryList,
          expenseCategoryList: state.expenseCategoryList,
          incomeCategoryAmount: incomeCategoryAmountList,
          expenseCategoryAmout: expenseCategoryAmountList));
      print('emitted');
      });

      // then((val) async {
      // List<CategoryModel> incomeCategories = [];
      // List<CategoryModel> expenseCategories = [];

      // print('Hello__________');

      // print('here');
      // CategoryModel? inc;
      // add(CategoryEvent.filterCategory());
      // final _data = await Hive.openBox<CategoryModel>('categoryDb');
      // final _allCategoryModel = _data.values.toList();
      // _allCategoryModel
      //     .sort((first, second) => second.id.compareTo(first.id));
      // Future.forEach(_allCategoryModel, (CategoryModel category) {
      //   if (category.field == CategoryField.income) {
      //     incomeCategories.add(category);
      //   } else {
      //     expenseCategories.add(category);
      //   }
      // });
      // .then((value)async {
      // // final incomeCategories = event.incomeCategories;
      // for (int i = 0; i < availableIncomeCategories.length; i++) {
      //   print('looping');
      //   print(availableIncomeCategories);
      //   print(incomeCategories);
      //   for (int j = 0; j < incomeCategories.length; j++) {
      //     print('second loop..');
      //     if (availableIncomeCategories[i] == incomeCategories[j].name) {
      //       print('checking ...');
      //       // inc = incomeCategories[j];
      //       incomeCategoryAmountList.add(incomeCategories[j]);
      //     }
      // }

      // if (!incomeCategoryAmountList.contains(inc) &&
      //     availableIncomeCategories.contains(inc!.name)) {
      //   incomeCategoryAmountList.add(inc);
      // }
      // }
      print(
          'availabel inc amountList${incomeCategoryAmountList.toList().toString()}');
          print('length of the amount list ${incomeCategoryAmountList.length}');
      // CategoryModel? exp;
      // // final expenseCategories = event.expenseCategories;
      // expenseCategoryAmountList.clear();
      // for (int i = 0; i < availableExpenseCategories.length; i++) {
      //   for (int j = 0; j < expenseCategories.length; j++) {
      //     if (availableExpenseCategories[i] == expenseCategories[j].name) {
      //       exp = expenseCategories[j];
      //     }
      //   }
      // if (!expenseCategoryAmountList.contains(exp)) {
      //   expenseCategoryAmountList.add(exp!);
      // }
      // }
      // });
      // then((value)async{

      // final _list0 = incomeCategoryAmountList;
      // if (_list0.length > 2 && _list0.isNotEmpty) {
      //   _list0.sort((first, second) =>
      //       second.categoryAmount!.compareTo(first.categoryAmount!));
      // }

      // for (int i = 0; i < _list0.length; i++) {
      //   if (_list0[i].categoryAmount != 0.0) {
      //     incomeCategoryAmountList.add(_list0[i]);
      //   }
      // }

      // final _list1 = expenseCategoryAmountList;
      // if (_list1.length > 2 && _list1[1] != null && _list1.isNotEmpty) {
      //   _list1.sort((first, second) =>
      //       second.categoryAmount!.compareTo(first.categoryAmount!));
      // }
      // print('final >>>>>>>>>>>>>>>>>>>');
      // for (int i = 0; i < _list0.length; i++) {
      //   if (_list0[i].categoryAmount != 0.0) {
      //     expenseCategoryAmountList.add(_list1[i]);
      //   }
      // }

      // });
      // });

      // emit(state.copyWith(
      //     categoryList: state.categoryList,
      //     incomeCategoryList: state.incomeCategoryList,
      //     expenseCategoryList: state.expenseCategoryList,
      //     incomeCategoryAmount: incomeCategoryAmountList,
      //     expenseCategoryAmout: expenseCategoryAmountList));
      // print('emitted');
    });
    on<DropdownOnChange>((event, emit) async {
      emit(state.copyWith(
          categoryList: state.categoryList,
          expenseCategoryList: state.expenseCategoryList,
          incomeCategoryList: state.incomeCategoryList,
          incomeCategoryAmount: state.incomeCategoryAmount,
          expenseCategoryAmout: state.expenseCategoryAmout,
          visibleList: event.changeList,
          dropDownValue: event.newValue));
    });
    on<CategoryDropDownChange>((event, emit) async {
      emit(state.copyWith(
          categoryDropDown: event.newCategoryValue,
          categoryList: state.categoryList,
          expenseCategoryList: state.expenseCategoryList,
          incomeCategoryList: state.incomeCategoryList,
          incomeCategoryAmount: state.incomeCategoryAmount,
          expenseCategoryAmout: state.expenseCategoryAmout,
          // visibleList: state.changeList,
          // dropDownValue: event.newValue
          isIncome: event.isIncome,
          isAdd: event.isAdd));
    });
  }
}
