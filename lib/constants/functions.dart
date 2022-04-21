import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'package:flutter/material.dart';

Future<void> selectedRangeTransactions({DateTime? start, DateTime? end}) async {
  TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
      .clear();
  print("selected range checking");
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
      print(transaction.note);
      print(transaction.date.toString());
      print('range end position');
      TransactionDbFunctions.instance.refreshData();
    } else if (TransactionDbFunctions
        .instance.selectedRangeTransactionsListener.value.isEmpty) {
      print('ELSE CONDITION WORKS WHEN RANGE FILTERING');
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .clear();
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
    }
  });
}

Future<void> selectedDayTransaction(DateTime? selectedDay) async {
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
      print('THE IF CONDITION ON DAY FILTERING');
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .add(transaction);

      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
      TransactionDbFunctions.instance.refreshData();

      print('selected day transactions');
      print(TransactionDbFunctions
          .instance.selectedRangeTransactionsListener.value[0].note);
    } else if (selectedDay.day != transaction.date.day &&
        TransactionDbFunctions
            .instance.selectedRangeTransactionsListener.value.isEmpty) {
      TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
          .clear();
      print("THE ELSE CONDITION WORKS WHEN DAY FILTERING USED !!");
      final trans = TransactionDbFunctions
          .instance.selectedRangeTransactionsListener.value
          .toList();
      print(' Values of day filter ${trans.toList().toString()}');
      TransactionDbFunctions.instance.selectedRangeTransactionsListener
          .notifyListeners();
    }

    TransactionDbFunctions.instance.selectedRangeTransactionsListener
        .notifyListeners();
  });
}

Future<void> selectedMonthTransactions(DateTime? selectedMonth) async {
  TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
      .clear();
  print(" ___________selected Month ${selectedMonth}");
  TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
      .clear();
  final List<TransactionModel> _listner =
      TransactionDbFunctions.instance.transactionListener.value.toList();

  print(selectedMonth);
  TransactionDbFunctions.instance.refreshData();
  await TransactionDbFunctions.instance.getTransaction();

  await Future.forEach(_listner, (TransactionModel transaction) async {
    print('printing the selected month transactions  ${transaction.note}');
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
  DateTime? start =selectedWeek?.startDate;
  DateTime? end =selectedWeek?.endDate;

  print(
      '______________The function has been accessed\n ${selectedWeek?.startDate.toString()} ${selectedWeek?.endDate.toString()}');
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

void notifications()async{
  String timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  AwesomeNotifications().createNotification(content: 
  NotificationContent(
    id:1 , channelKey: 'key1',
    title: "Reminder",
    body: "Don't forget to enter your transactions today.",
    // bigPicture: 
    ),
    schedule: NotificationInterval(interval: 5,timeZone: timeZone,repeats: false)
  );
}