import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/data.dart';
import 'package:coin_wise/constants/functions.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/main.dart';
// import 'package:coin_wise/main.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/screens/main_screens/home.dart';
import 'package:coin_wise/trial.dart';
import 'package:coin_wise/widgets/list_views.dart';
import 'package:coin_wise/widgets/widgets.dart';
// import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_date_pickers/flutter_date_pickers.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'package:flutter_date_pickers/flutter_date_pickers.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
    TransactionDbFunctions.instance.refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            color: brightness != Brightness.light
                ? defaultColor
                : defaultColorDark,
            height: displayHeight(context) * .20,
            item: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                decentHieght,

                // showBox(
                //   color: defaultPrimaryColor,
                //   x: displayWidth(context) * .88,
                //   y: displayHeight(context) * .10,
                //   item: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       showBox(
                //         x: displayWidth(context) * .36,
                //         y: displayHeight(context) * .09,
                //         color: defaultPrimaryColor,
                //         item: Column(
                //           mainAxisSize: MainAxisSize.min,
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: const [
                //             SizedBox(
                //                 child: Text(
                //               'Total Income',
                //               style: onboardBody,
                //             )),
                //             Text(
                //               '₹ 4534535',
                //               style: boxSubBoldTitle,
                //             ),
                //           ],
                //         ),
                //       ),
                //       verticalDivider,
                //       showBox(
                //         color: defaultPrimaryColor,
                //         x: displayWidth(context) * .36,
                //         y: displayHeight(context) * .09,
                //         item: Column(
                //           mainAxisSize: MainAxisSize.min,
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: const [
                //             SizedBox(
                //               child: Text(
                //                 'Total Expense',
                //                 style: onboardBody,
                //               ),
                //             ),
                //             Text(
                //               '₹ 34535',
                //               style: boxSubBoldTitle,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

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

                                        // if( !isSameDate(dat1, ranges.startDate)|| !isSameDate(dat2,ranges.endDate))
                                        //  {
                                        _controller.selectedRange =
                                            PickerDateRange(dat1, dat2);

                                        // }
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
                                            child: const Text('Cancel')),
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
                                            child: const Text('Ok'))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });

                        print('this week');
                      },
                    ),
                    ActionChip(
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
                                print(selectedDate);
                                selectedMonthTransactions(selectedDate);
                              });
                            }
                          });

                          print('Month');
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //_______________DROPDOWN - ALL TRANSACTION ____________

                        showBox(
                            color: _dropdownValue == allFields[0]
                                ? defaultPrimaryColor
                                : primaryGrey,
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
                                      child: Text(items),
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
                            )),
                      ],
                    ),
                  ],
                ),
                const MyFormField(),
// DateRangePickerDialog(firstDate: firstDate, lastDate: lastDate)
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
          //  TransactionList(
          //    dropDownList: TransactionDbFunctions.instance.transactionExpenseListener,
          //   isIncome: true,
          // ),
        ],
      ),
    );
  }
}
