import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/widgets/custom_tile.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:coin_wise/core/constants/text_styles.dart';
import 'package:coin_wise/data/model/transaction_model.dart';
import 'package:coin_wise/screens/main_screens/all_transactions/all_transactions.dart';

class TransactionList extends StatelessWidget {
  final int? count;
  final bool? isIncome;

  final List<TransactionModel> dataList;
  const TransactionList({
    this.count,
    this.isIncome,
    required this.dataList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dataList.isNotEmpty
        ? ListView.builder(
            // reverse: true,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, index) {
              final data = dataList[index];
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
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                SizedBox(
                  height: displayHeight(context) * .2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.find_in_page,
                      size: 40,
                    ),
                    Text(
                      'No transactions found !',
                      style: boxTitle,
                    )
                  ],
                ),
                const Text('add new transactions for monitering...')
              ]);
    // },
    // );
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

// *___________________ for categorized transactions list selection ____________________________

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
