import 'package:bloc/bloc.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/data/model/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'filtertransaction_state.dart';
part 'filtertransaction_cubit.freezed.dart';

class FiltertransactionCubit extends Cubit<FiltertransactionState> {
  FiltertransactionCubit() : super(FiltertransactionState.initial());

  Future<void> selectedRangeTransactions(
      {DateTime? start,
      DateTime? end,
      DateTime? selectedDay,
      DateTime? selectedMonth,
      PickerDateRange? selectedWeek,
      bool isRange = false,
      bool isDay = false,
      bool isWeek = false,
      bool isMonth = false}) async {
    List<TransactionModel> selectedRangeTransactionsList = [];
    final data = await Hive.openBox<TransactionModel>('transaction_Db');
    final List<TransactionModel> _listner = data.values.toList();
    if (isRange) {
      await Future.forEach(_listner, (TransactionModel transaction) async {
        if (start == null && end == null) {
          return;
        }
        if (transaction.date.isAfter(start!) &&
            transaction.date.isBefore(end!)) {
          selectedRangeTransactionsList.clear();
          selectedRangeTransactionsList.add(transaction);

          selectedRangeTransactionsList.add(transaction);
        } else if (transaction == null) {
          selectedRangeTransactionsList.clear();
        }
      });
    } else if (isMonth) {
      await Future.forEach(_listner, (TransactionModel transaction) async {
        if (selectedMonth?.month == transaction.date.month &&
            selectedMonth?.year == transaction.date.year) {
          selectedRangeTransactionsList.add(transaction);
        }
      });
    } else if (isWeek) {
      DateTime? weekStart = selectedWeek?.startDate;
      DateTime? weekEnd = selectedWeek?.endDate;
      await Future.forEach(_listner, (TransactionModel transaction) async {
        if (transaction.date.isAfter(weekStart!) &&
            transaction.date.isBefore(weekEnd!)) {
          selectedRangeTransactionsList.add(transaction);
        }
      });
    } else if (isDay) {
      await Future.forEach(_listner, (TransactionModel transaction) async {
        if (selectedDay == null) {
          return;
        }

        if (selectedDay.day == transaction.date.day &&
            selectedDay.year == transaction.date.year &&
            selectedDay.month == transaction.date.month) {
          selectedRangeTransactionsList.add(transaction);
        }
      });
    }
    emit(state.copyWith(
        filterList: selectedRangeTransactionsList, isFilter: true));
  }

  void filterDropDownChange({required String newValue}) {
    emit(state.copyWith(fitlerDropdownValue: newValue));
  }
}
