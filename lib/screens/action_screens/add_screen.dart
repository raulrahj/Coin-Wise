import 'package:coin_wise/main.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/fab-button.view.dart';
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
    dropDownValue==null;

    print("checking the isAdd is working or not");
    print(isAdd);
    isAdd ?? false;
    print('after the null aware ${isAdd}');
    ////////////// TO DO - null check operator used in a null value ////////////////////////
    if (!isAdd!) {
     _updateNoteController.text = selectedTransactionData!.note;
     _updateAmoutnController.text = selectedTransactionData!.amount.toString();
    }
    print('selected Transaction Data printing>>>>>>>>>>>>>>>>>>>>>>>');
    print(selectedTransactionData?.amount);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: defaultLightColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                 Navigator.pop(context);
                 dropDownValue=null;
              },
              icon: const Icon(
                Icons.close,
                color: primaryDark,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Categories()));
                },
                icon: const Icon(
                  Icons.list,
                  color: primaryDark,
                ))
          ],
        ),
        //<<<<<<<<<<<<<<<<<<< FLOATING ACTION BUTTON >>>>>>>>>>>>>>>>>>>>>

        floatingActionButton: PandaBarFabButton(
            icon: Text(
              isAdd! ? 'ADD' : 'UPDATE',
              style: const TextStyle(
                  color: primaryLight, fontWeight: FontWeight.bold),
            ),
            colors: const [defaultColor, defaultColor],
            size: 50,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                if (isAdd!) {
                  // isAdd! ?
                  // var transactionData =await addTransaction();
                  // if(transactionData!=null)
                  double? parsed = double.tryParse(_amountController.text);
                  field ?? 1;
                  final transactionData = TransactionModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                      date: date ?? DateTime.now(),
                      amount: parsed ?? 0000.0,
                      note: _noteController.text,
                      field: field == 0
                          ? CategoryField.income
                          : CategoryField.expense,
                      category: globalCategory!);
                  TransactionDbFunctions.instance
                      .addTransaction(transactionData);
                  int count = 0;
                  navigatorKey?.currentState?.pop();
                  // Navigator.of(context).popUntil((_) => count++ >= 2);
                  _amountController.clear();
                  await TransactionDbFunctions.instance.getTransaction();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(10),
                      backgroundColor: defaultColor,
                      content: Text(
                        'Added ${_noteController.text}...',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                  _noteController.clear();
                } else {
                  double? parsedUpdate =
                      double.tryParse(_updateAmoutnController.text);
                  final updateTransactionData = TransactionModel(
                    id: selectedTransactionData!.id,
                      date: date??selectedTransactionData!.date,
                      amount: parsedUpdate!,
                      note: _updateNoteController.text,
                      field: selectedTransactionData!.field,
                      category: globalCategory ?? selectedTransactionData!.category);
                  TransactionDbFunctions.instance.updateTransaction(
                      selectedTransactionData!.id, updateTransactionData);
                          dropDownValue=null;
                  Navigator.of(context).pop();
                  await TransactionDbFunctions.instance.getTransaction();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior
                          .floating, //behavior used to change decoration or change default config
                      margin: const EdgeInsets.all(10),
                      backgroundColor: defaultColor,
                      content: Text(
                        'Updated ${_updateNoteController.text}...',
                        style: const TextStyle(color: Colors.white),
                      )));
                }
                // else
                // print('transactiondata is null');
              }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                    const  Icon(Icons.add_box),
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
                    decoration: const BoxDecoration(color: defaultPrimaryColor),
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
                                      
                                      borderSide: const BorderSide(
                                        color: primaryDark,
                                      ),
                                      
          // labelText: 'Select Date',labelStyle: TextStyle(color: defaultPrimaryColor),
                                    ),
                                    prefixIcon: const Date(),
                                  ),
        //      decoration:const InputDecoration(
        //   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryDark)),
        //   labelText: 'Date Range',labelStyle: TextStyle(color: primaryDark),
        //   prefixIcon: Icon(Icons.date_range,color: defaultPrimaryColor,),
        //   hintText: 'Please select a start and end date',
        //   border: OutlineInputBorder(borderSide: BorderSide(color: defaultPrimaryColor)),
        // ),
                                  onTap: () {
                                    const Date();
                                  },
                                ),
                                ActionBox(
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
                                    bottomSpace,
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
