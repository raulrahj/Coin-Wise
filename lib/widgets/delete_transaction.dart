
//__________________________ TRANSACTION DELETION POPUP SCREEN ______________________________

import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/main.dart';
import 'package:flutter/material.dart';

transactionDeletePopup(BuildContext context, String? key) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you really want to delete this\ntransaction'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      navigatorKey?.currentState?.pop();
                    },
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      TransactionDbFunctions.instance
                          .deleteTransaction(context, key);
                      //  Navigator.of(context).pop();
                      navigatorKey?.currentState?.pop();
                    },
                    child: Text(
                      'Ok',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}
