import 'package:hive_flutter/hive_flutter.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> notifications() async {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1, channelKey: 'key1',
      title: "Reminder",
      body: "Don't forget to enter your transactions today.",
    ),
    schedule: NotificationCalendar(
      hour: 19,
      minute: 00,
      second: 0,
      millisecond: 0,
      repeats: true,
      allowWhileIdle: true,
    ),
  );
}

Future<void> defaultCategoryAdding(context) async {
  final categoryDB = await Hive.openBox<CategoryModel>('categoryDb');

  Future.forEach(defaultIncomeCategories, (String element) async {
    final _defaultCategories = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: element,
        field: CategoryField.income);
    categoryDB.add(_defaultCategories);

  });
  Future.forEach(defaultExpenseCategories, (String element) async {
    final _defaultCategories = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: element,
        field: CategoryField.expense);
    categoryDB.add(_defaultCategories);
  
  });
}
// sort((first,csecond)=> first.date.comparedTo(second.date));
