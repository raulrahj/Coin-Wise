
import 'package:coin_wise/core/constants/data.dart';

import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

bool isFilter = false;

// Future<void> selectedRangeTransactions({DateTime? start, DateTime? end}) async {
//   isFilter = true;
//   TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//       .clear();
//   await TransactionDbFunctions.instance.getTransaction();

//   final List<TransactionModel> _listner =
//       TransactionDbFunctions.instance.transactionListener.value.toList();
//   await Future.forEach(_listner, (TransactionModel transaction) async {
//     if (start == null && end == null) {
//       return;
//     }
//     if (transaction.date.isAfter(start!) && transaction.date.isBefore(end!)) {
//       _listner.clear();

//       TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//           .add(transaction);
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener
//           .notifyListeners();
//       TransactionDbFunctions.instance.refreshData();
//     } else if (TransactionDbFunctions
//         .instance.selectedRangeTransactionsListener.value.isEmpty) {
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//           .clear();
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener
//           .notifyListeners();
//     }
//   });
// }

// Future<void> selectedDayTransaction(DateTime? selectedDay) async {
//   isFilter = true;

//   TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//       .clear();
//   await TransactionDbFunctions.instance.getTransaction();

//   final List<TransactionModel> _listner =
//       TransactionDbFunctions.instance.transactionListener.value.toList();

//   await Future.forEach(_listner, (TransactionModel transaction) async {
//     if (selectedDay == null) {
//       return;
//     }

//     if (selectedDay.day == transaction.date.day &&
//         selectedDay.year == transaction.date.year &&
//         selectedDay.month == transaction.date.month) {
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//           .add(transaction);

//       TransactionDbFunctions.instance.selectedRangeTransactionsListener
//           .notifyListeners();
//       TransactionDbFunctions.instance.refreshData();
//     } else if (selectedDay.day != transaction.date.day &&
//         TransactionDbFunctions
//             .instance.selectedRangeTransactionsListener.value.isEmpty) {
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//           .clear();
//       final trans = TransactionDbFunctions
//           .instance.selectedRangeTransactionsListener.value
//           .toList();
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener
//           .notifyListeners();
//     }

//     TransactionDbFunctions.instance.selectedRangeTransactionsListener
//         .notifyListeners();
//   });
// }

// Future<void> selectedMonthTransactions(DateTime? selectedMonth) async {
//   isFilter = true;

//   TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//       .clear();
//   TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//       .clear();
//   final List<TransactionModel> _listner =
//       TransactionDbFunctions.instance.transactionListener.value.toList();

//   TransactionDbFunctions.instance.refreshData();
//   await TransactionDbFunctions.instance.getTransaction();

//   await Future.forEach(_listner, (TransactionModel transaction) async {

//     if (selectedMonth?.month == transaction.date.month &&
//         selectedMonth?.year == transaction.date.year) {
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//           .add(transaction);
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener
//           .notifyListeners();
//       // TransactionDbFunctions.instance.refreshData();
//     } else if (selectedMonth != transaction.date &&
//         TransactionDbFunctions
//             .instance.selectedRangeTransactionsListener.value.isEmpty) {
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//           .clear();
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener
//           .notifyListeners();
//     }
//   });
// }

// Future<void> selectedWeekTransactions(PickerDateRange? selectedWeek) async {
//   isFilter = true;

//   DateTime? start = selectedWeek?.startDate;
//   DateTime? end = selectedWeek?.endDate;
//   TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//       .clear();
//   await TransactionDbFunctions.instance.getTransaction();
//   final List<TransactionModel> _listener =
//       TransactionDbFunctions.instance.transactionListener.value.toList();
//   await Future.forEach(_listener, (TransactionModel transaction) async {
//     if (transaction.date.isAfter(start!) && transaction.date.isBefore(end!)) {
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//           .add(transaction);
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener
//           .notifyListeners();
//       TransactionDbFunctions.instance.refreshData();
//     } else {
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener.value
//           .clear();
//       TransactionDbFunctions.instance.selectedRangeTransactionsListener
//           .notifyListeners();
//     }
//   });
//   TransactionDbFunctions.instance.refreshData();
// }

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


Future<void> defaultCategoryAdding() async {
  Future.forEach(defaultIncomeCategories, (String element) {
    final _defaultCategories = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: element,
        field: CategoryField.income);
        // context.read<CategoryBloc>().add();
    // CategoryFunctions.instance.insertCategory(_defaultCategories);
  });
  Future.forEach(defaultExpenseCategories, (String element) {
    final _defaultCategories = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: element,
        field: CategoryField.expense);
    // CategoryFunctions.instance.insertCategory(_defaultCategories);
  });
}
// sort((first,csecond)=> first.date.comparedTo(second.date));
