import 'package:coin_wise/main.dart';
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
import 'package:coin_wise/screens/action_screens/add_transaction/widgets/dropdown_category.dart';

// bool? isAdd;
Color? ontapColor;
double? ontapBorder;
// int categoryType = 0;

final _amountController = TextEditingController();
final _noteController = TextEditingController();

final _updateAmoutnController = TextEditingController();
final _updateNoteController = TextEditingController();
bool inUpdate = false;

class AddScreen extends StatelessWidget {
  final int? field;
  final dropvalue;

  final TransactionModel? selectedTransactionData;
  AddScreen({
    Key? key,
    this.field,
    this.selectedTransactionData,
    this.dropvalue,
  }) : super(key: key);

//  TransactionModel get transactionData => transactionData;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    dropDownValue == null;
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
                dropDownValue = null;
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
                context.read<CategoryBloc>().add(GetAllCategory());
                if (state.isAdd == false && inUpdate == true) {
                  _updateAmoutnController.text =
                      selectedTransactionData!.amount.toString();
                  _updateNoteController.text = selectedTransactionData!.note;
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
                                : 'Update transaction',
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
                                      onTap: () => inUpdate = false,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      activeColor:
                                          Theme.of(context).iconTheme.color!,
                                      controller: state.isAdd
                                          ? _amountController
                                          : _updateAmoutnController,
                                      keyboardtype: TextInputType.number,
                                      hint: 'Amount',
                                      validator: (value) {
                                        inUpdate = false;
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
                                        CategoryDropdown(
                                          contxt: context,
                                          items: state.categories,
                                          newState: state,
                                        ),
                                        ActionBox(
                                          onTap: (() => inUpdate = false),
                                          activeColor: primaryGreyDark,
                                          controller: state.isAdd
                                              ? _noteController
                                              : _updateNoteController,
                                          prefix: const Icon(
                                            Icons.note_alt,
                                            color: defaultPrimaryColor,
                                          ),
                                          hint: 'Note',
                                          itemColor: primaryLight,
                                          validator: (value) {
                                            inUpdate = false;
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
                                                .validate()&& globalCategory!=null) {
                                              if (state.isAdd) {
                                                double? parsed =
                                                    double.tryParse(
                                                        _amountController.text);
                                                field ?? 1;
                                                final transactionData =
                                                    TransactionModel(
                                                        id: DateTime.now()
                                                            .millisecondsSinceEpoch
                                                            .toString(),
                                                        date: date ??
                                                            DateTime.now(),
                                                        amount:
                                                            parsed ?? 0000.0,
                                                        note: _noteController
                                                            .text,
                                                        field:
                                                            field == 0
                                                                ? CategoryField
                                                                    .income
                                                                : CategoryField
                                                                    .expense,
                                                        category:
                                                            globalCategory??state.categories[0]);
                                                // TransactionDbFunctions.instance
                                                //     .addTransaction(
                                                //         transactionData);
                                                // if (globalCategory != null) {
                                                  context
                                                      .read<TransactionsBloc>()
                                                      .add(AddTransaction(
                                                          model:
                                                              transactionData));
                                                // }

                                                navigatorKey?.currentState
                                                    ?.pop();
                                                _amountController.clear();
                                                _noteController.clear();
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
                                                          'Added ${_noteController.text}...',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                                _noteController.clear();
                                              } else {
                                                double? parsedUpdate =
                                                    double.tryParse(
                                                        _updateAmoutnController
                                                            .text);
                                                final updateTransactionData = TransactionModel(
                                                    id: selectedTransactionData!
                                                        .id,
                                                    date: date ??
                                                        selectedTransactionData!
                                                            .date,
                                                    amount: parsedUpdate!,
                                                    note: _updateNoteController
                                                        .text,
                                                    field:
                                                        selectedTransactionData!
                                                            .field,
                                                    category: globalCategory ??
                                                        selectedTransactionData!
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
                                                dropDownValue = null;
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
                                                              'Updated ${_updateNoteController.text}...',
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

  Future addTransactions() async {
    final _noteText = _noteController.text;
    if (date == null || globalCategory == null) {
      return;
    }

    final _parsedAmount = double.tryParse(_amountController.text);
    if (_parsedAmount == null) {
      return;
    }
    if (_noteText.isEmpty) {
      return;
    }
  }
}
