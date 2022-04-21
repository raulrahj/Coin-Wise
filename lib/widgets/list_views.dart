// import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/screens/main_screens/all_transactions.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final int? count;
  final bool? isIncome;
  ValueListenable<List<TransactionModel>> dropDownList;
  TransactionList({
    this.count,
    this.isIncome,
    required this.dropDownList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      // TransactionDbFunctions.instance.refreshData();
    return ValueListenableBuilder(
      valueListenable: dropDownList,
      builder: (context, List<TransactionModel> newTransactionListener, child) {
        int? homeCount = newTransactionListener.length >= 4 ? count : 0;
        return Align(
          alignment: Alignment.topCenter,
          child: newTransactionListener.length >=1?
           ListView.builder(
            reverse: true,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount:
                // (homeCount!=0)?homeCount :
                newTransactionListener.length,
            itemBuilder: (BuildContext context, index) {
              final data = newTransactionListener[index];
              return CustomTile(
                mainData: data,
                context: context,
                title: data.note,
                trailing: '₹ ${data.amount}',
                style: amountColor(data.field),
                subTitle1: formatedDate(data.date),
                subTitle2: data.category.name,
                deletionKey: data.id,
              );
            },
          ):
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: displayHeight(context)*.2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.find_in_page,size: 40,),Text('No transactions found !',style: boxTitle,)
              ],
            ),
            Text('add new transactions for monitering...')
          ])
        );
      },
    );
  }
}

TextStyle amountColor(field) {
  return TextStyle(fontWeight: FontWeight.w700, color: colr(field));
}

Color colr(field) {
  return (field == CategoryField.expense) ? Colors.redAccent : Colors.green;
}

String formatedDate(DateTime parsedate) {
  final date = DateFormat.MMMd().format(parsedate);
  final _format = date.split(' ');
  return '${_format.last} ${_format.first}';
}

//___________________ for categorized transactions list selection ____________________________

class FieldTransactions extends StatelessWidget {
  const FieldTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dropDownListener,
      builder: (context, newDropDownListener, child) {
        return ListView.builder(
          itemBuilder: ((context, index) {
            // final _data = newDropDownListener[index];
            return CustomTile(
                title: 'title',
                trailing: 'trailing',
                subTitle1: 'subTitle1',
                subTitle2: 'subTitle2');
          }),
        );
      },
    );
  }
}
