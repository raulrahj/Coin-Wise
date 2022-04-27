import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/data.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/screens/main_screens/home.dart';
import 'package:coin_wise/widgets/graph.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Analysis extends StatefulWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  String dropDownValue = fields[0];

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).primaryColorDark;
    // isHome=true;
    setState(() {
      if (dropDownValue.toString() == fields[1]) {
        expenseList();
      } else {
        incomeList();
      }
    });
    refreshCategoryAmountListners();
    CategoryFunctions.instance.incomeAmountCategoryListner.value.clear();

    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: showBox(
              color: bg,
              y: displayHeight(context) * 0.05,
              x: displayWidth(context) * 0.05,
              alignment: Alignment.center,
              item: DropdownButton(
                underline: const SizedBox(),
                alignment: Alignment.centerRight,
                value: dropDownValue,
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: displayWidth(context) * .6,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: defaultLightColor,
                    ),
                  ],
                ),
                items: fields.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropDownValue = value.toString();
                  });
                },
              ),
            ),
          ),

          //___________________________PIE CHART _________________
// const PieChartSample3(),
          TransactionDbFunctions.instance.transactionListener.value != null
              ? PieChartSample3()
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
                    ]),
          //__________________________LIST VIEW ________________________
          ValueListenableBuilder(
              valueListenable:
                  CategoryFunctions.instance.multiAmountCategoryListener,
              builder:
                  (context, List<CategoryModel> newAmountCategories, child) {
                Color bg = Theme.of(context).primaryColor;
                //  CategoryFunctions.instance.categoryAmountAdding();
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: newAmountCategories.length,
                    itemBuilder: (BuildContext context, index) {
                      CategoryModel _data = newAmountCategories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                              child: dropDownValue == fields[0]
                                  ? ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      tileColor: bg,
                                      // tileColor:brightness!=Brightness.light? defaultPrimaryColor:defaultColorDark,
                                      title: Text(_data.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                fontSize: 16,
                                              )),
                                      trailing: Text(_data.categoryAmount !=
                                              null
                                          ? '₹ ${_data.categoryAmount.toString()}'
                                          : '₹ 0.0'),
                                    )
                                  : ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      tileColor: Theme.of(context).indicatorColor,
                                      title: Text(
                                        _data.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!.copyWith(fontSize: 16,)
                                      ),
                                      trailing: Text(_data.categoryAmount !=
                                              null
                                          ? '₹ ${_data.categoryAmount.toString()}'
                                          : '0.0'),
                                    )),
                        ),
                      );
                    });
              })
        ],
      ),
    );
  }
}
