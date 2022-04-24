import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coin_wise/constants/data.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/screens/action_screens/add_screen.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

bool isFilter = false;

Future<void> selectedRangeTransactions({DateTime? start, DateTime? end}) async {
  isFilter = true;
  TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
      .clear();
  await TransactionDbFunctions.instance.getTransaction();

  final List<TransactionModel> _listner =
      TransactionDbFunctions.instance.transactionListener.value.toList();
  await Future.forEach(_listner, (TransactionModel transaction) async {
    if (start == null && end == null) {
      return;
    }
    if (transaction.date.isAfter(start!) && transaction.date.isBefore(end!)) {
      _listner.clear();

      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .add(transaction);
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
      TransactionDbFunctions.instance.refreshData();
    } else if (TransactionDbFunctions
        .instance.selectedRangeTransactionsListener.value.isEmpty) {
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .clear();
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
    }
  });
}

Future<void> selectedDayTransaction(DateTime? selectedDay) async {
  isFilter = true;

  TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
      .clear();
  await TransactionDbFunctions.instance.getTransaction();

  final List<TransactionModel> _listner =
      TransactionDbFunctions.instance.transactionListener.value.toList();

  await Future.forEach(_listner, (TransactionModel transaction) async {
    if (selectedDay == null) {
      return;
    }

    if (selectedDay.day == transaction.date.day &&
        selectedDay.year == transaction.date.year &&
        selectedDay.month == transaction.date.month) {
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .add(transaction);

      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
      TransactionDbFunctions.instance.refreshData();
    } else if (selectedDay.day != transaction.date.day &&
        TransactionDbFunctions
            .instance.selectedRangeTransactionsListener.value.isEmpty) {
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .clear();
      final trans = TransactionDbFunctions
          .instance.selectedRangeTransactionsListener.value
          .toList();
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
    }

    TransactionDbFunctions.instance.selectedRangeTransactionsListener
        .notifyListeners();
  });
}

Future<void> selectedMonthTransactions(DateTime? selectedMonth) async {
  isFilter = true;

  TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
      .clear();
  TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
      .clear();
  final List<TransactionModel> _listner =
      TransactionDbFunctions.instance.transactionListener.value.toList();

  TransactionDbFunctions.instance.refreshData();
  await TransactionDbFunctions.instance.getTransaction();

  await Future.forEach(_listner, (TransactionModel transaction) async {
    // if (selectedMonth == null) {
    //   print('The selected month is empty');
    //   return;
    // }
    if (selectedMonth?.month == transaction.date.month &&
        selectedMonth?.year == transaction.date.year) {
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .add(transaction);
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
      // TransactionDbFunctions.instance.refreshData();
    } else if (selectedMonth != transaction.date.month &&
        TransactionDbFunctions
            .instance.selectedRangeTransactionsListener.value.isEmpty) {
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .clear();
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
    }
  });
}

Future<void> selectedWeekTransactions(PickerDateRange? selectedWeek) async {
  isFilter = true;

  DateTime? start = selectedWeek?.startDate;
  DateTime? end = selectedWeek?.endDate;
  TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
      .clear();
  await TransactionDbFunctions.instance.getTransaction();
  final List<TransactionModel> _listener =
      TransactionDbFunctions.instance.transactionListener.value.toList();
  await Future.forEach(_listener, (TransactionModel transaction) async {
    if (transaction.date.isAfter(start!) && transaction.date.isBefore(end!)) {
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .add(transaction);
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
      TransactionDbFunctions.instance.refreshData();
    } else {
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .clear();
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
    }
  });
  TransactionDbFunctions.instance.refreshData();
}

Future<void> notifications() async {
  String timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1, channelKey: 'key1',
      title: "Reminder",
      body: "Don't forget to enter your transactions today.",

      // bigPicture:
    ),
    schedule: NotificationCalendar(
      // weekday: notificationSchedule.dayOfTheWeek,
      hour: 19,
      minute: 00,
      second: 0,
      millisecond: 0,
      repeats: true,
      allowWhileIdle: true,
    ),
  );
}

// void isExpense(context) {
//   isAdd = true;
//   categoryMod = 1;
//   var field = 1;
//   Navigator.push(
//       context, MaterialPageRoute(builder: (ctx) => AddScreen(field: field)));
//   dropDownValue = null;
// }

Future<void> defaultCategoryAdding() async {
  Future.forEach(defaultIncomeCategories, (String element) {
    final _defaultCategories = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: element,
        field: CategoryField.income);
    CategoryFunctions.instance.insertCategory(_defaultCategories);
  });
  Future.forEach(defaultExpenseCategories, (String element) {
    final _defaultCategories = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: element,
        field: CategoryField.expense);
    CategoryFunctions.instance.insertCategory(_defaultCategories);
  });
}
// sort((first,csecond)=> first.date.comparedTo(second.date));

void incomeList() async{
  
  final _list0 =
      CategoryFunctions.instance.incomeAmountCategoryListner.value.toList();
      if(_list0.isEmpty){return;}
      print(_list0);
  _list0.sort((first, second) =>
      second.categoryAmount!.compareTo(first.categoryAmount!));
  CategoryFunctions.instance.multiAmountCategoryListener.value.clear();
  CategoryFunctions.instance.multiAmountCategoryListener.value = _list0;
  refreshCategoryAmountListners();
}

void expenseList()async {
  final _list1 =
      CategoryFunctions.instance.expenseAmountCategoryListner.value.toList();
  _list1.sort((first, second) =>
      second.categoryAmount!.compareTo(first.categoryAmount!));
  CategoryFunctions.instance.multiAmountCategoryListener.value.clear();
  CategoryFunctions.instance.multiAmountCategoryListener.value = _list1;
  refreshCategoryAmountListners();
}

void refreshCategoryAmountListners() {
  //  CategoryFunctions.instance. categoryAmounts();
  CategoryFunctions.instance.multiAmountCategoryListener.notifyListeners();
  CategoryFunctions.instance.incomeAmountCategoryListner.notifyListeners();
  CategoryFunctions.instance.expenseAmountCategoryListner.notifyListeners();
}
