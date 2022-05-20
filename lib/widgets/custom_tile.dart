//______________________________________CUSTOM TILE___________________

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:coin_wise/data/model/category_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:coin_wise/data/model/transaction_model.dart';
import 'package:coin_wise/widgets/delete_transaction.dart';
import 'package:coin_wise/core/constants/text_styles.dart';
import 'package:coin_wise/logic/bloc/transactions/transactions_bloc.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/add_screen.dart';
import 'package:coin_wise/screens/action_screens/add_transaction/widgets/dropdown_category.dart';

class CustomTile extends StatelessWidget {
  void popupEdit(BuildContext context) {
    BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        // TODO: implement listener

        // context.read<TransactionsBloc>().add(const GetAllTransactions());
      },
      //child:_,
    );
    // inUpdate = true;
    // isAdd = false;
    mainData?.field == CategoryField.income ? categoryMod = 0 : categoryMod = 1;
    // dropDownValue == null;
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return AddScreen(selectedTransactionData: mainData);
    }));
  }

  final TransactionModel? mainData;
  final String title;
  final String trailing;
  TextStyle? style;
  final String subTitle1;
  final String subTitle2;
  BuildContext? context;
  String? deletionKey;
  void Function()? function;
  CustomTile(
      {required this.title,
      required this.trailing,
      this.style,
      this.function,
      this.context,
      this.deletionKey,
      Key? key,
      required this.subTitle1,
      required this.subTitle2,
      this.mainData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<TransactionsBloc>().add(const GetAllTransactions());

    Color red = Theme.of(context).indicatorColor;
    Color green = Theme.of(context).selectedRowColor;
    Color bg = Theme.of(context).primaryColor;
    Color bgSub = Theme.of(context).primaryColorLight;
    Color fg = Theme.of(context).primaryIconTheme.color!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      //_____________ SLIDABLE DELETION AND EDIT > UX <_______________________________

      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: (value) async {
                context
                    .read<TransactionsBloc>()
                    .add(const TransactionController(
                      isAdd: false,
                      isIncome: true,
                      // categories: state.categories,
                    ));
                popupEdit(value);
              },
              backgroundColor: bgSub,
              foregroundColor: fg,
              icon: Icons.edit,
              label: 'Edit',
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            /** To Do */
            SlidableAction(
              flex: 1,
              onPressed: (context)async {
                print('deletion');
                  // context
                  //           .read<TransactionsBloc>()
                  //           .add(TransactionsEvent.deleteTransaction(keey: mainData!.id!));
                            context.read<TransactionsBloc>().add(TransactionsEvent.getAllTransactions());
                transactionDeletePopup(context, mainData!.id);
              },
              backgroundColor: bgSub,
              foregroundColor: fg,
              icon: Icons.delete,
              label: 'Delete',
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            color: bg,
            child: Row(
              children: <Widget>[
                Container(
                  color: mainData!.field == CategoryField.income ? green : red,
                  width: 60,
                  height: 60,
                  child: const Icon(Icons.currency_rupee, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: ListTitle,
                      ),
                      Wrap(
                        children: [
                          Text(
                            subTitle1,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text(
                            ' | ',
                            style: defaultTitle,
                          ),
                          Text(
                            subTitle2,
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(trailing, style: style)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
