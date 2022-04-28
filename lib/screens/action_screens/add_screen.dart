import 'package:coin_wise/main.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/screens/action_screens/categories.dart';

bool? isAdd;
Color? ontapColor;
double? ontapBorder;
int categoryType = 0;

final _amountController = TextEditingController();
final _noteController = TextEditingController();

final _updateAmoutnController = TextEditingController();
final _updateNoteController = TextEditingController();

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
    isAdd ?? false;
    ////////////// TO DO - null check operator used in a null value ////////////////////////
 
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
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      decentWidth,
                      const Icon(Icons.add_box),
                      Text(
                        isAdd! ? 'Add transaction' : 'Update transaction',
                        style: defaultTitle,
                      )
                    ],
                  ),
                  //<<<<<<<<<<<<<< Main session begin >>>>>>>>>>>>>>
                  Container(
                    width: displayWidth(context),
                    height: displayHeight(context),
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.none,
                                  enabled: true,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryDark)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                        color:
                                            Theme.of(context).iconTheme.color!,
                                      ),
                                    ),
                                    prefixIcon: const Date(),
                                  ),
                                  onTap: () {
                                    const Date();
                                  },
                                ),
                                ActionBox(
                                  activeColor:
                                      Theme.of(context).iconTheme.color!,
                                  controller: isAdd!
                                      ? _amountController
                                      : _updateAmoutnController,
                                  keyboardtype: TextInputType.number,
                                  hint: 'Amount',
                                  validator: (value) {
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
                            decoration: const BoxDecoration(color: primaryDark),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: displayHeight(context) * .6,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CategoryDropdown(contxt: context),
                                    ActionBox(
                                      activeColor: primaryGreyDark,
                                      controller: isAdd!
                                          ? _noteController
                                          : _updateNoteController,
                                      prefix: const Icon(
                                        Icons.note_alt,
                                        color: defaultPrimaryColor,
                                      ),
                                      hint: 'Note',
                                      itemColor: primaryLight,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'try to add a note !';
                                        }
                                        return null;
                                      },
                                    ),
                                    addHorizontalSpace(
                                        displayHeight(context) * .1),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          if (isAdd!) {
                                           
                                            double? parsed = double.tryParse(
                                                _amountController.text);
                                            field ?? 1;
                                            final transactionData =
                                                TransactionModel(
                                                    id:
                                                        DateTime.now()
                                                            .millisecondsSinceEpoch
                                                            .toString(),
                                                    date:
                                                        date ?? DateTime.now(),
                                                    amount: parsed ?? 0000.0,
                                                    note: _noteController.text,
                                                    field: field == 0
                                                        ? CategoryField.income
                                                        : CategoryField.expense,
                                                    category: globalCategory!);
                                            TransactionDbFunctions.instance
                                                .addTransaction(
                                                    transactionData);
                                            navigatorKey?.currentState?.pop();
                                            _amountController.clear();
                                            await TransactionDbFunctions
                                                .instance
                                                .getTransaction();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                width:
                                                    displayWidth(context) * 03,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Added ${_noteController.text}...',
                                                      style: const TextStyle(
                                                          color: Colors.white),
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
                                            final updateTransactionData =
                                                TransactionModel(
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
                                            TransactionDbFunctions.instance
                                                .updateTransaction(
                                                    selectedTransactionData!.id,
                                                    updateTransactionData);
                                            dropDownValue = null;
                                            Navigator.of(context).pop();
                                            await TransactionDbFunctions
                                                .instance
                                                .getTransaction();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    width:
                                                        displayWidth(context) *
                                                            .5,
                                                    backgroundColor:
                                                        defaultColor,
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Updated ${_updateNoteController.text}...',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    )));
                                          }
                                        }
                                      },
                                      child: Text(
                                        isAdd! ? 'SAVE' : 'UPDATE',
                                        style: const TextStyle(
                                            color: primaryLight,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    bottomSpace(displayHeight(context) * .10),
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
            ),
          ),
        ),
      ),
    );
  }

  Future addTransaction() async {
    final _noteText = _noteController.text;
    if (date == null) {
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
