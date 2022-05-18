import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/logic/bloc/transactions/transactions_bloc.dart';
import 'package:coin_wise/logic/cubit/filter_transactions/filtertransaction_cubit.dart';
import 'package:coin_wise/main.dart';
import 'package:coin_wise/widgets/common_container.dart';
import 'package:coin_wise/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:coin_wise/widgets/date.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:coin_wise/widgets/list_views.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/screens/main_screens/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColorDark;
    if (isHome) {
      setState(() {
      });
    }
    return SafeArea(child:
        BlocBuilder<FiltertransactionCubit, FiltertransactionState>(
            builder: (context, state) {
      return ListView(
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
                          selectdate = newdata;
                          context
                              .read<FiltertransactionCubit>()
                              .selectedRangeTransactions(
                                  isDay: true, selectedDay: selectdate);
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
                                              context
                                                  .read<
                                                      FiltertransactionCubit>()
                                                  .selectedRangeTransactions(
                                                      isWeek: true,
                                                      selectedWeek: _controller
                                                          .selectedRange);
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
                              selectedDate = date;
                              context
                                  .read<FiltertransactionCubit>()
                                  .selectedRangeTransactions(
                                      isMonth: true,
                                      selectedMonth: selectedDate);
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
                                onTap: () {
                                  context
                                      .read<FiltertransactionCubit>()
                                      .filterDropDownChange(
                                        newValue: state.fitlerDropdownValue,
                                      );
                                },
                                onChanged: (value) {
                                  isHome = false;
                                  context
                                      .read<FiltertransactionCubit>()
                                      .filterDropDownChange(
                                          newValue: value.toString());
                                  // setState(() {
                                  _dropdownValue = state.fitlerDropdownValue;
                                  if (_dropdownValue == allFields[1]) {
                                    context.read<TransactionsBloc>().add(
                                        SeparateTransactions(
                                            listType: allFields[1]));
                                  } else if (_dropdownValue == allFields[2]) {
                                    context.read<TransactionsBloc>().add(
                                        SeparateTransactions(
                                            listType: allFields[2]));
                                  } else {
                                    context.read<TransactionsBloc>().add(
                                        SeparateTransactions(
                                            listType: allFields[0]));
                                  }
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
          !state.isFilter
              ? BlocBuilder<TransactionsBloc, TransactionsState>(
                  builder: (context, state) {
                    return TransactionList(
                      dataList: state.transactionList,
                    );
                  },
                )
              : TransactionList(dataList: state.filterList)
          // });
        ],
        // )
      );
    }));
  }
}
