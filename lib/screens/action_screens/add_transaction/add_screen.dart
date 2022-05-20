import 'package:coin_wise/main.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/widgets/expense_dropdown.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/widgets/income_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/data/model/transaction_model.dart';
import 'package:coin_wise/core/constants/text_styles.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:coin_wise/logic/bloc/transactions/transactions_bloc.dart';
import 'package:coin_wise/screens/action_screens/categories/categories.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/widgets/textformfield1.dart';

// bool? isAdd;
Color? ontapColor;
double? ontapBorder;
CategoryModel? globalCategory;

// int categoryType = 0;

// final _amountController = TextEditingController();
// final _noteController = TextEditingController();

// final _updateAmoutnController = TextEditingController();
// final _updateNoteController = TextEditingController();
// bool inUpdate = false;

class AddScreen extends StatefulWidget {
  final int? field;
  final dropvalue;

  final TransactionModel? selectedTransactionData;
  AddScreen({
    Key? key,
    this.field,
    this.selectedTransactionData,
    this.dropvalue,
  }) : super(key: key);
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  final _updateAmoutnController = TextEditingController();
  final _updateNoteController = TextEditingController();

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
//  TransactionModel get transactionData => transactionData;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // context.read<CategoryBloc>().add(GetAllCategory());

    // dropDownValue == null;
    // isAdd ?? false;
/**
 * TODO - null check operator used in a null value
 */
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              tooltip: 'close',
              onPressed: () {
                Navigator.pop(context);
                // dropDownValue = null;
              },
              icon: Icon(
                Icons.close,
                color: Theme.of(context).iconTheme.color,
              )),
          actions: [
            IconButton(
                tooltip: 'categories',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Categories()));
                },
                icon: Icon(
                  Icons.list,
                  color: Theme.of(context).iconTheme.color,
                ))
          ],
        ),
        body: Center(
          //<<<<<<<<<<<<<< Single child Scroll View >>>>>>>>>>>>>>>>>

          child: Form(
            key: _formKey,
            child: BlocConsumer<TransactionsBloc, TransactionsState>(
              listener: (context, state) {},
              builder: (context, state) {
                print('ischanging ?');
                print(state.isIncome);
                context.read<CategoryBloc>().add(GetAllCategory());
                if (state.isAdd == false) {
                  widget._updateAmoutnController.text =
                      widget.selectedTransactionData!.amount.toString();
                  widget._updateNoteController.text =
                      widget.selectedTransactionData!.note;
                }
                return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          decentWidth,
                          const Icon(Icons.add_box),
                          Text(
                            state.isAdd
                                ? 'Add transaction'
                                : 'Edit transaction',
                            style: defaultTitle,
                          )
                        ],
                      ),
                      //<<<<<<<<<<<<<< Main session begin >>>>>>>>>>>>>>
                      Container(
                        width: displayWidth(context),
                        height: displayHeight(context),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.none,
                                      enabled: true,
                                      decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: primaryDark)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color!,
                                          ),
                                        ),
                                        prefixIcon: const Date(),
                                      ),
                                      onTap: () {
                                        const Date();
                                      },
                                    ),
                                    ActionBox(
                                      // onTap: () => inUpdate = false,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      activeColor:
                                          Theme.of(context).iconTheme.color!,
                                      controller: state.isAdd
                                          ? widget._amountController
                                          : widget._updateAmoutnController,
                                      keyboardtype: TextInputType.number,
                                      hint: 'Amount',
                                      validator: (value) {
                                        // inUpdate = false;
                                        // inUpdate=true;
                                        if (value == null || value.isEmpty) {
                                          return 'enter the amount !';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                //   height: displayHeight(context),
                                decoration:
                                    const BoxDecoration(color: primaryDark),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: displayHeight(context) * .6,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        BlocBuilder<TransactionsBloc, TransactionsState>(
                                          builder: (context, tstate) {
                                            print(tstate.isIncome);
                                            print('eeey state print');
                                            return Container(
                                                child: tstate.isIncome
                                                    ? IncomeDropDown()
                                                    : ExpenseDropDown());
                                          },
                                        ),
                                        // CategoryDropdown(
                                        //   contxt: context,
                                        //   // items: state.categories,
                                        //   newState: state,
                                        // ),
                                        ActionBox(
                                          // onTap: (() => inUpdate = false),
                                          activeColor: primaryGreyDark,
                                          controller: state.isAdd
                                              ? widget._noteController
                                              : widget._updateNoteController,
                                          prefix: const Icon(
                                            Icons.note_alt,
                                            color: defaultPrimaryColor,
                                          ),
                                          hint: 'Note',
                                          itemColor: primaryLight,
                                          validator: (value) {
                                            // inUpdate = false;
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'try to add a note !';
                                            }
                                            return null;
                                          },
                                        ),
                                        addHorizontalSpace(
                                            displayHeight(context) * .1),
                                        ElevatedButton(
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                    .validate() &&
                                                globalCategory != null) {
                                              if (state.isAdd) {
                                                double? parsed =
                                                    double.tryParse(widget
                                                        ._amountController
                                                        .text);
                                                widget.field ?? 1;
                                                final transactionData =
                                                    TransactionModel(
                                                        id: DateTime.now()
                                                            .millisecondsSinceEpoch
                                                            .toString(),
                                                        date: date ??
                                                            DateTime.now(),
                                                        amount: parsed ??
                                                            0000.0,
                                                        note:
                                                            widget
                                                                ._noteController
                                                                .text,
                                                        field: state.isIncome
                                                            ? CategoryField
                                                                .income
                                                            : CategoryField
                                                                .expense,
                                                        category:
                                                            globalCategory!);
                                                // TransactionDbFunctions.instance
                                                //     .addTransaction(
                                                //         transactionData);
                                                // if (globalCategory != null) {
                                                context
                                                    .read<TransactionsBloc>()
                                                    .add(TransactionsEvent
                                                        .addTransaction(
                                                            model:
                                                                transactionData));
                                                // }

                                                navigatorKey?.currentState
                                                    ?.pop();
                                                widget._amountController
                                                    .clear();
                                                widget._noteController.clear();
                                                // await TransactionDbFunctions
                                                //     .instance
                                                // .getTransaction();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    width:
                                                        displayWidth(context) *
                                                            .5,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .snackBarTheme
                                                            .backgroundColor,
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Added ${widget._noteController.text}...',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                                widget._noteController.clear();
                                              } else {
                                                double? parsedUpdate =
                                                    double.tryParse(widget
                                                        ._updateAmoutnController
                                                        .text);
                                                final updateTransactionData = TransactionModel(
                                                    id: widget
                                                        .selectedTransactionData!
                                                        .id,
                                                    date: date ??
                                                        widget
                                                            .selectedTransactionData!
                                                            .date,
                                                    amount: parsedUpdate!,
                                                    note: widget
                                                        ._updateNoteController
                                                        .text,
                                                    field: widget
                                                        .selectedTransactionData!
                                                        .field,
                                                    category: globalCategory ??
                                                        widget
                                                            .selectedTransactionData!
                                                            .category);
                                                /** 
                                            * ! To Do
                                            * TODO: something penging here
                                            *? should implement the update function here
                                                * ! TransactionDbFunctions.instance
                                                * !     .updateTransaction(
                                                * !         selectedTransactionData!
                                                * !             .id,
                                                * !         updateTransactionData);
                                                */
                                                context
                                                    .read<TransactionsBloc>()
                                                    .add(UpdateTransaction(
                                                        id: widget
                                                            .selectedTransactionData!
                                                            .id!,
                                                        model: widget
                                                            .selectedTransactionData!));
                                                // dropDownValue = null;
                                                Navigator.of(context).pop();
                                                // await TransactionDbFunctions
                                                //     .instance
                                                // .getTransaction();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        width: displayWidth(
                                                                context) *
                                                            .5,
                                                        backgroundColor: Theme
                                                                .of(context)
                                                            .snackBarTheme
                                                            .backgroundColor,
                                                        content: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Updated ${widget._updateNoteController.text}...',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        )));
                                              }
                                            }
                                          },
                                          child: Text(
                                            state.isAdd ? 'SAVE' : 'UPDATE',
                                            style: const TextStyle(
                                                color: primaryLight,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        bottomSpace(
                                            displayHeight(context) * .10),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Future addTransactions() async {
  //   final _noteText = widget._noteController.text;
  //   if (date == null || globalCategory == null) {
  //     return;
  //   }

  //   final _parsedAmount = double.tryParse(widget._amountController.text);
  //   if (_parsedAmount == null) {
  //     return;
  //   }
  //   if (_noteText.isEmpty) {
  //     return;
  //   }
  // }

  // @override
  // void dispose() {
  //   print('yes this is the matter');
  //   widget._amountController.dispose();
  //   widget._noteController.dispose();
  //   widget._updateAmoutnController.dispose();
  //   widget._updateNoteController.dispose();

  //   super.dispose();
  // }
}
