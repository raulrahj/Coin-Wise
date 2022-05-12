import 'package:coin_wise/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:coin_wise/widgets/date.dart';
import 'package:coin_wise/constants/data.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/widgets/list_views.dart';
import 'package:coin_wise/constants/functions.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/screens/main_screens/home.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

ValueListenable<List<TransactionModel>> dropDownListener = ValueNotifier([]);

var _dropdownValue = allFields[0];

class _AllTransactionsState extends State<AllTransactions> {
  @override
  void initState() {
    //TransactionDbFunctions.instance.getWallet();
    // TransactionDbFunctions.instance.refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColorDark;
    // TransactionDbFunctions.instance.getWallet;
    TransactionDbFunctions.instance.getTransaction();
    if (isHome) {
      setState(() {
        dropDownListener = TransactionDbFunctions.instance.transactionListener;
      });
    }
    return SafeArea(
      child: ListView(
        children: [
          defaultContainer(
            color: bg,
            height: displayHeight(context) * .20,
            item: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                decentHieght,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //_____________________ACTION CHIP POSITION__________
                    ActionChip(
                        label: const Text("Day"),
                        onPressed: () async {
                          DateTime? selectdate;
                          var newdata = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 30)),
                              lastDate: DateTime.now());

                          if (newdata == null) return;
                          setState(
                            () {
                              selectdate = newdata;
                            },
                          );
                          selectedDayTransaction(selectdate);
                          date;
                        }),
                    ActionChip(
                      label: const Text('week'),
                      onPressed: () async {
                        final DateRangePickerController _controller =
                            DateRangePickerController();
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 150, horizontal: 40),
                                child: Column(
                                  children: [
                                    SfDateRangePicker(
                                      // backgroundColor: primaryBlack,
                                      controller: _controller,
                                      view: DateRangePickerView.month,
                                      selectionMode:
                                          DateRangePickerSelectionMode.range,
                                      onSelectionChanged: (Args) {
                                        int firstDayOfWeek =
                                            DateTime.sunday % 7;
                                        int endDayOfWeek =
                                            (firstDayOfWeek - 1) % 7;
                                        endDayOfWeek = endDayOfWeek < 0
                                            ? 7 + endDayOfWeek
                                            : endDayOfWeek;
                                        PickerDateRange ranges = Args.value;
                                        DateTime date1 = ranges.startDate!;
                                        DateTime date2 = (ranges.endDate ??
                                            ranges.startDate)!;
                                        if (date1.isAfter(date2)) {
                                          var date = date1;
                                          date1 = date2;
                                          date2 = date;
                                        }
                                        int day1 = date1.weekday % 7;
                                        int day2 = date2.weekday % 7;

                                        DateTime dat1 = date1.add(Duration(
                                            days: (firstDayOfWeek - day1)));
                                        DateTime dat2 = date2.add(Duration(
                                            days: (endDayOfWeek - day2)));
                                        _controller.selectedRange =
                                            PickerDateRange(dat1, dat2);
                                      },
                                      monthViewSettings:
                                          const DateRangePickerMonthViewSettings(
                                              enableSwipeSelection: false),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              navigatorKey?.currentState?.pop();
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              if (_controller.selectedRange ==
                                                  null) {
                                                navigatorKey?.currentState
                                                    ?.pop();
                                              }
                                              selectedWeekTransactions(
                                                  _controller.selectedRange);
                                              navigatorKey?.currentState?.pop();
                                            },
                                            child: Text(
                                              'Ok',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                    ActionChip(
                        backgroundColor:
                            Theme.of(context).chipTheme.backgroundColor,
                        label: const Text('Month'),
                        onPressed: () async {
                          DateTime? selectedDate;
                          final DateTime initialDate = DateTime.now();
                          showMonthPicker(
                            context: context,
                            firstDate: DateTime(DateTime.now().year - 1, 5),
                            lastDate: DateTime(
                                DateTime.now().year, DateTime.now().month),
                            initialDate: selectedDate ?? initialDate,
                            locale: const Locale("en"),
                          ).then((date) {
                            if (date != null) {
                              setState(() {
                                selectedDate = date;
                                selectedMonthTransactions(selectedDate);
                              });
                            }
                          });
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //_______________DROPDOWN - ALL TRANSACTION ____________

                        showBox(
                          color: _dropdownValue == allFields[0]
                              ? Theme.of(context).chipTheme.backgroundColor
                              : primaryGreyDark,
                          y: displayHeight(context) * .045,
                          x: displayWidth(context) * .35,
                          item: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownButton(
                                underline: const SizedBox(),
                                alignment: Alignment.centerRight,
                                value: _dropdownValue,
                                icon: SizedBox(
                                  width: displayWidth(context) * .10,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                                items: allFields.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  isHome = false;

                                  setState(() {
                                    _dropdownValue = value.toString();
                                    switch (value) {
                                      case 'All':
                                        dropDownListener = (isFilter)
                                            ? TransactionDbFunctions.instance
                                                .selectedRangeTransactionsListener
                                            : TransactionDbFunctions
                                                .instance.transactionListener;
                                        break;
                                      case 'Income':
                                        dropDownListener =
                                            TransactionDbFunctions.instance
                                                .transactionIncomeListener;
                                        break;
                                      case 'Expense':
                                        dropDownListener =
                                            TransactionDbFunctions.instance
                                                .transactionExpenseListener;
                                        break;
                                      default:
                                        dropDownListener =
                                            TransactionDbFunctions
                                                .instance.transactionListener;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const MyFormField(),
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: dropDownListener,
              builder: (context, newDropdownListener, child) {
                return TransactionList(
                  dropDownList: dropDownListener,
                );
              }),
        ],
      ),
    );
  }
}
