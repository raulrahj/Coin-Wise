import 'dart:io';
import 'package:coin_wise/app_themes.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/widgets/list_views.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';

final String? profilepic = loginData?.profilePhoto;
final  brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).platformBrightness;
bool isHome =true;
// _______________________________ HOME PAGE _____________________________________ //
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColorDark;
    Color bgSub = Theme.of(context).primaryColorLight;
    CategoryFunctions.instance.refreshUI();
    ProflieDb().refreshProfile();
    TransactionDbFunctions.instance.refreshData();
    final String message =
        DateTime.now().hour < 12 ? "Good morning..." : "Good Afternoon...";

    // appbar = false;
    return SafeArea(
      child: SingleChildScrollView(
        child: ValueListenableBuilder(
            valueListenable: TransactionDbFunctions.instance.walletDataListener,
            builder: (context, double newWalletDataListner, child) {
              return Column(
                children: [
                  ValueListenableBuilder(
                      valueListenable: profileListner,
                      builder: (context,ProfileModel newProfileListener, child) {
                        final ProfileModel _data =newProfileListener;
                        return ListTile(
                          leading: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message,
                                  style: const TextStyle(
                                      color: defaultColor, fontSize: 12),
                                ),
                                Text(
                                  _data.profileName!,
                                  style: boxTitle,
                                ),
                              ]),
                          trailing: _data.profilePhoto == null
                              ? const CircleAvatar(
                                  // backgroundColor: primaryGrey,
                                  child: Icon(
                                    Icons.person,
                                    size: 33,
                                    color: primaryBlack,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(File(_data.profilePhoto!)),
                                ),
                        );
                      }),
                  defaultContainer(
                    color: bg,
                    // color: brightness != Brightness.light ?  defaultColor : defaultColorDark,
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
                              Text(
                                '₹ ${newWalletDataListner.toString()}',
                                style: (newWalletDataListner < 0)
                                    ? fortotalNegBal
                                    : fortotalBal,
                              ),
                            ],
                          ),
                        ),
                        showBox(
                          x: displayWidth(context) * .85,
                          color: bgSub,
                          // color:brightness!=Brightness.light? defaultPrimaryColor: defaultPrimaryColorDark,
                          item: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              showBox(
                                x: displayWidth(context) * 0.42,
                                color: bgSub,
                                // color:brightness!=Brightness.light? defaultPrimaryColor:defaultPrimaryColorDark,
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
                                    ValueListenableBuilder(
                                        valueListenable: TransactionDbFunctions.instance.walletIncomeListener,
                                      builder: (context,double newIncome,child) {
                                        return Text(
                                          '₹ ${newIncome.toString()}',
                                          style:brightness!=Brightness.light? boxSubBoldTitle: boxSubBoldTitleDark,
                                        );
                                      }
                                    )
                                  ],
                                ),
                              ),
                              verticalDivider,
                              showBox(
                                x: displayWidth(context) * 0.42,
                                color: bgSub,
                                // color:brightness!=Brightness.light? defaultPrimaryColor:defaultPrimaryColorDark,
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
                                    ValueListenableBuilder(
                                      valueListenable: TransactionDbFunctions.instance.walletExpenseListener,
                                      builder: (context,double newExpense,childe) {
                                        return Text(
                                          '₹ ${newExpense.toString()}',
                                          style:brightness!=Brightness.light? boxSubBoldTitle:boxSubBoldTitleDark,
                                        );
                                      }
                                    ),
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
                        child: const Text(
                          'See all',
                          style: TextStyle(color: primaryDark),
                        ),
                        ////////////// ToDo -gesture detector exeption issue ////////////
                        onPressed: () async {
                          page = 1;
                        }),
                  ),
                  TransactionList(
                    dropDownList:
                        TransactionDbFunctions.instance.transactionListener,
                    count: 4,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

//_______________________________ MAIN NAVIGATION SECTION ___________________________________
var page = 0;

// bool appbar = true;
// ValueListenable<bool> appBar = ValueNotifier(false);

// class Navigate extends StatefulWidget {
//   const Navigate({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Navigate> createState() => _NavigateState();
// }

// class _NavigateState extends State<Navigate> {
//   static const List<Widget> pages = <Widget>[
//     Home(),
//     AllTransactions(),
//     Analysis(),
//     Settings()
//   ];

//   Widget? currentpage;
//   // = pages[0];
//   @override
//   void initState() {
//     print('init printing');
//     //WARNING
//     // TransactionDbFunctions.instance.walletData();
//     // TransactionDbFunctions.instance.refreshData();
//     CategoryFunctions.instance.refreshUI();
//     // defaultCategoryAdding();
//     // incomeList();

//     super.initState();
//   }
//   @override
//   void dispose() {

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TransactionDbFunctions.instance.refreshData();

//     int field;
//     // setState(() {
//     currentpage = pages[page];
//     // });
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           appbarTitle[page],
//           style: boxTitle,
//         ),
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(gradient: defaultBoxGradient),
//         ),
//       ),
//       backgroundColor: defaultLightColor,
//       bottomNavigationBar: PandaBar(
//         fabColors: const [
//           defaultColor,
//           defaultColor,
//         ],
//         backgroundColor: defaultPrimaryColor,
//         buttonColor: primaryBlack,
//         buttonSelectedColor: primaryDark,
//         buttonData: [
//           PandaBarButtonData(id: 0, icon: Icons.home),
//           PandaBarButtonData(id: 1, icon: Icons.account_balance_wallet),
//           PandaBarButtonData(id: 2, icon: Icons.query_stats_rounded),
//           PandaBarButtonData(id: 3, icon: Icons.settings),
//         ],
//         onChange: (id) {
//           setState(() {
//             page = id;
//           });
//         },
//         onFabButtonPressed: () async {
//           showDialog(
//               context: context,
//               builder: (ctx) {
//                 return addTransactionPopup();
//               });
//         },
//       ),
//       body: DoubleBackToCloseApp(
//         snackBar: const SnackBar(
//           content: Text(
//             'Double tap to close the app !',
//           ),
//           shape: StadiumBorder(),
//           behavior: SnackBarBehavior.floating,
//           margin: EdgeInsets.symmetric(horizontal: 70),
//         ),
//         child: Builder(
//           builder: (context) {
//             isFilter=false;
//             switch (page) {
//               case 0:
//                 return const Home();
//               case 1:
//                 return const AllTransactions();
//               case 2:
//                 return const Analysis();
//               case 3:
//                 return const Settings();
//               default:
//                 return Container(
//                   color: primaryDark,
//                   child: const Text('None'),
//                 );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
