import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/data.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/models/category_model.dart';
import 'package:coin_wise/widgets/graph.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Analysis extends StatefulWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  String dropDownValue = fields[0];
  @override
  Widget build(BuildContext context) {
    appbar = false;
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: showBox(
                color: primaryGreen,
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
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  items: fields.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value.toString();
                      value == fields[0]
                          ? CategoryFunctions.instance.amountCategoryListner =
                              CategoryFunctions.instance.incomeCategoryListner
                          : CategoryFunctions.instance.amountCategoryListner =
                              CategoryFunctions.instance.expenseCategoryListner;
                      print('THE DROPDOWN VALUE PRINTING ${value}');
                    });
                  },
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionChip(
                label: const Text("Today"),
                onPressed: () {
                  print('today');
                },
              ),
              ActionChip(
                label: const Text('week'),
                onPressed: () {
                  print('this week');
                },
              ),
              ActionChip(
                  label: const Text('Month'),
                  onPressed: () {
                    print('Month');
                  }),
              ActionChip(
                  label: const Text('Year'),
                  onPressed: () {
                    print('Year');
                  })
            ],
          ),
          PieChartSample3(),
          ValueListenableBuilder(
              valueListenable: CategoryFunctions.instance.amountCategoryListner,
              builder:
                  (context, List<CategoryModel> newAmountCategories, child) {
                //  CategoryFunctions.instance.categoryAmountAdding();
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: newAmountCategories.length,
                    itemBuilder: (BuildContext context, index) {
                      CategoryModel _data = newAmountCategories[index];
                      print(
                          "PRINTING THE VALUE NOTIFIER CATEGORY AMOUNT ${_data.categoryAmount}");
                      return Card(
                          child: dropDownValue == fields[0]
                              ? ListTile(
                                  tileColor: defaultPrimaryColor,
                                  title: Text(_data.name),
                                  trailing:
                                      Text(_data.categoryAmount.toString()),
                                )
                              : ListTile(
                                  tileColor: primaryRed,
                                  title: Text(_data.name),
                                  trailing: Text(
                                      '₹ ${_data.categoryAmount.toString()}'),
                                ));
                    });
              })
        ],
      ),
    );
  }
}
