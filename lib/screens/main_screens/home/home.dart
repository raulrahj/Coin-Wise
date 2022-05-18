import 'dart:io';
import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/core/constants/text_styles.dart';
import 'package:coin_wise/logic/bloc/category/category_bloc.dart';
import 'package:coin_wise/logic/bloc/transactions/transactions_bloc.dart';
import 'package:coin_wise/widgets/common_container.dart';
import 'package:coin_wise/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:coin_wise/widgets/list_views.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final String? profilepic = loginData?.profilePhoto;
final brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
    .platformBrightness;
bool isHome = true;

// _______________________________ HOME PAGE _____________________________________ //
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    context.read<TransactionsBloc>().add(const GetAllTransactions());
    context.read<CategoryBloc>().add(const CategoryEvent.getAllCategory());
    Color bg = Theme.of(context).primaryColorDark;
    Color bgSub = Theme.of(context).primaryColorLight;

    // CategoryFunctions.instance.refreshUI();
    ProflieDb().refreshProfile();
    // TransactionDbFunctions.instance.refreshData();
    final String message =
        DateTime.now().hour < 12 ? "Good morning..." : "Good Afternoon...";
  final ProfileModel  _data;
    // appbar = false;
    return SafeArea(
      child: SingleChildScrollView(
        // child: ValueListenableBuilder(
        //     valueListenable: TransactionDbFunctions.instance.walletDataListener,
        //     builder: (context, double newWalletDataListner, child) {
              // return
            child: Column(
                children: [
                  // ValueListenableBuilder(
                  //     valueListenable: profileListner,
                  //     builder:
                  //         (context, ProfileModel newProfileListener, child) {
                        // final ProfileModel _data = newProfileListener;
                        // return
                         ListTile(
                          leading: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message,
                                  style: const TextStyle(
                                      color: defaultColor, fontSize: 12),
                                ),
                                addHorizontalSpace(4.0),
                                Text('loading...',
                                  // _data.profileName!,
                                  style: boxTitle,
                                ),
                              ]),
                          trailing:
                          //  _data.profilePhoto == null
                          1>0
                              ? const CircleAvatar(
                                  // backgroundColor: primaryGrey,
                                  child: Icon(
                                    Icons.person,
                                    size: 33,
                                    color: primaryBlack,
                                  ),
                                )
                              : CircleAvatar(
                                  // backgroundImage:
                                      // FileImage(File(_data.profilePhoto!)),
                                ),
                        ),
                      // }),
                  defaultContainer(
                    color: bg,
                    height: 180,
                    item: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        showBox(
                          color: bg,
                          x: displayWidth(context) * 0.88,
                          item: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Total Balance',
                                style: boxTitle,
                              ),
                              Text('loading...',
                                // '₹ ${newWalletDataListner.toString()}',
                                style: (1 < 0)
                                    ? fortotalNegBal
                                    : fortotalBal,
                              ),
                            ],
                          ),
                        ),
                        showBox(
                          x: displayWidth(context) * .85,
                          color: bgSub,
                          item: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              showBox(
                                x: displayWidth(context) * 0.42,
                                color: bgSub,
                                item: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Wrap(
                                      children: const [
                                        Text(
                                          'Income',
                                          style: boxLightTitle,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_up,
                                          size: 17,
                                        ),
                                      ],
                                    ),
                                    // ValueListenableBuilder(
                                    //     valueListenable: TransactionDbFunctions
                                    //         .instance.walletIncomeListener,
                                    //     builder:
                                    //         (context, double newIncome, child) {
                                          // return
                                           Text('loading...',
                                            // '₹ ${newIncome.toString()}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          )
                                        // })
                                  ],
                                ),
                              ),
                              verticalDivider(context),
                              showBox(
                                x: displayWidth(context) * 0.42,
                                color: bgSub,
                                item: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Wrap(
                                      children: const [
                                        Text(
                                          'Expense',
                                          style: boxLightTitle,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 17,
                                        ),
                                      ],
                                    ),
                                    // ValueListenableBuilder(
                                    //     valueListenable: TransactionDbFunctions
                                    //         .instance.walletExpenseListener,
                                    //     builder: (context, double newExpense,
                                    //         childe) {
                                    //       return 
                                          Text('loading...',
                                            // '₹ ${newExpense.toString()}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        // }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Text(
                      'Recent Transactions',
                      style: boxTitle,
                    ),
                    trailing: TextButton(
                        child: Text(
                          'See all',
                          style: TextStyle(
                              color: Theme.of(context).iconTheme.color),
                        ),
                        ////////////// ToDo -gesture detector exeption issue ////////////
                        onPressed: () async {
                          page = 1;
                        }),
                  ),
                  BlocBuilder<TransactionsBloc, TransactionsState>(
                    // bloc: TransactionsBloc(),
                    builder: (context, state) {
                      return TransactionList(
                        dataList: state.transactionList,
                        count: 4,
                      );
                    },
                  ),
                ],
              )
            // }),
      ),
    );
  }
}

//_______________________________ MAIN NAVIGATION SECTION ___________________________________
var page = 0;
